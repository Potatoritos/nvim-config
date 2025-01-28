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
    local util = require('lspconfig.util')
    lsp.basedpyright.setup({ capabilities = capabilities })
    lsp.clangd.setup({
        capabilities = capabilities,
        init_options = { fallbackFlags = { '--std=c++20' } },
    })
    lsp.tinymist.setup({
        capabilities = capabilities,
        settings = {
            formatterMode = 'typstyle',
            semanticTokens = 'disable',
            exportPdf = 'never',
            rootPath = '/home/potatoritos/notes/',
        },
    })
    local find = function(to_find, startpath)
        return vim.fs.dirname(vim.fs.find(to_find, { path = startpath, upward = true })[1])
    end
    lsp.biome.setup({
        capabilities = capabilities,
        root_dir = function(fname)
            return util.root_pattern('biome.json', 'biome.jsonc')(fname)
                or find('package.json', fname)
                or find('node_modules', fname)
                or find('.git', fname)
        end,
    })
    lsp.lua_ls.setup({ capabilities = capabilities })
    lsp.vtsls.setup({
        capabilities = capabilities,
        filetypes = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'vue',
        },
        settings = {
            vtsls = {
                tsserver = {
                    globalPlugins = {
                        {
                            name = '@vue/typescript-plugin',
                            location = '/usr/local/lib/node_modules/@vue/language-server',
                            languages = { 'vue' },
                            configNamespace = 'typescript',
                            enableForWorkspaceTypeScriptVersions = true,
                        },
                    },
                },
            },
        },
    })
    lsp.volar.setup({
        capabilities = capabilities,
        init_options = {
            typescript = {
                tsdk = '/usr/local/lib/node_modules/typescript/lib/',
            },
        },
    })
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
                desc = 'Code action',
            },
            {
                'K',
                function()
                    vim.cmd.RustLsp({ 'hover', 'actions' })
                end,
                mode = 'n',
                ft = 'rust',
            },
        },
        dependencies = { 'saghen/blink.cmp' },
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
