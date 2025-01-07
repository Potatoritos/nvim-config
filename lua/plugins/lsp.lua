local show_only_one_sign_in_sign_column = function()
    local ns = vim.api.nvim_create_namespace('severe-diagnostics')

    local orig_signs_handler = vim.diagnostic.handlers.signs

    local filter_diagnostics = function(diagnostics)
        if not diagnostics then
            return {}
        end

        local most_severe = {}
        for _, cur in pairs(diagnostics) do
            local max = most_severe[cur.lnum]

            if not max or cur.severity < max.severity then
                most_severe[cur.lnum] = cur
            end
        end

        return vim.tbl_values(most_severe)
    end

    vim.diagnostic.handlers.signs = {
        show = function(_, bufnr, _, opts)
            local diagnostics = vim.diagnostic.get(bufnr)
            local filtered_diagnostics = filter_diagnostics(diagnostics)

            orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
        end,

        hide = function(_, bufnr)
            orig_signs_handler.hide(ns, bufnr)
        end,
    }
end

local ls_setup = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local lsp = require('lspconfig')
    lsp.basedpyright.setup({ capabilities = capabilities })
    lsp.clangd.setup({ capabilities = capabilities })
    lsp.eslint.setup({
        capabilities = capabilities,
        settings = {
            rulesCustomizations = {
                -- { rule = '@typescript-eslint/no-misused-promises', severity = 'off' },
                -- { rule = '@typescript-eslint/no-unsafe-argument', severity = 'off' },
                -- { rule = '@typescript-eslint/no-unsafe-assignment', severity = 'off' },
                -- { rule = 'import/defaults', severity = 'off' },
                -- { rule = 'import/extensions', severity = 'off' },
                -- { rule = 'import/namespace', severity = 'off' },
                -- { rule = 'import/no-cycle', severity = 'off' },
                -- { rule = 'import/no-unresolved', severity = 'off' },
                { rule = '*no-unused-vars', severity = 'off' },
            },
        },
    })
    lsp.lua_ls.setup({ capabilities = capabilities })
    lsp.ts_ls.setup({
        capabilities = capabilities,
        init_options = {
            plugins = {
                -- npm install -g @vue/language-server @vue/typescript-plugin
                {
                    name = '@vue/typescript-plugin',
                    location = '/usr/local/lib/node_modules/@vue/language-server',
                    languages = { 'vue' },
                },
            },
        },
        filetypes = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'vue',
        },
    })
    lsp.volar.setup({ capabilities = capabilities })
end

return {
    {
        'neovim/nvim-lspconfig',
        event = {
            'BufReadPre',
            'BufNewFile',
        },
        config = function()
            ls_setup()
            show_only_one_sign_in_sign_column()
        end,
        dependencies = {
            'saghen/blink.cmp',
        },
    },
    {
        'williamboman/mason.nvim',
        opts = {},
        keys = {
            {
                '<F5>',
                '<cmd>Mason<CR>',
                mode = 'n',
            },
        },
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                'basedpyright',
                'clangd',
                'eslint',
                'lua_ls',
                'rust_analyzer',
                'ts_ls',
                'volar',
            },
        },
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false,
        keys = {
            {
                '<leader>la',
                function()
                    vim.cmd.RustLsp('codeAction')
                end,
                mode = 'n',
                ft = 'rust',
                desc = 'Code action (LSP)',
            },
            {
                '<leader>K',
                function()
                    vim.cmd.RustLsp({ 'hover', 'actions' })
                end,
                mode = 'n',
                ft = 'rust',
            },
        },
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
}
