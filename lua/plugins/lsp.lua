local function show_only_one_sign_in_sign_column()
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

local function ls_setup()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local lsp = require('lspconfig')
    local util = require('lspconfig.util')
    lsp.basedpyright.setup({ capabilities = capabilities })
    lsp.markdown_oxide.setup({
        capabilities = vim.tbl_deep_extend('force', capabilities, {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
            },
        }),
        on_attach = function()
            vim.api.nvim_create_user_command('Daily', function(args)
                local input = args.args

                vim.lsp.buf.execute_command({ command = 'jump', arguments = { input } })
            end, { desc = 'Open daily note', nargs = '*' })
        end,
    })
    lsp.clangd.setup({
        capabilities = capabilities,
        init_options = {
            -- fallbackFlags = { '--std=c++20' },
        },
        cmd = {
            'clangd',
            '--header-insertion=never',
        },
    })
    lsp.tinymist.setup({
        capabilities = capabilities,
        settings = {
            formatterMode = 'typstyle',
            semanticTokens = 'disable',
            exportPdf = 'never',
            rootPath = '/home/potatoritos/notes/',
        },
        root_dir = function(_, _)
            return '/home/potatoritos/notes/'
        end,
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
                'K',
                function()
                    vim.cmd.RustLsp({ 'hover', 'actions' })
                end,
                ft = 'rust',
            },
            {
                '<Leader>le',
                function()
                    vim.cmd.RustLsp('expandMacro')
                end,
                ft = 'rust',
                desc = 'Expand macro',
            },
            {
                '<Leader>lJ',
                function()
                    vim.cmd.RustLsp('joinLines')
                end,
                ft = 'rust',
                desc = 'Join lines',
            },
            {
                '<Leader>lc',
                function()
                    vim.cmd.RustLsp('openCargo')
                end,
                ft = 'rust',
                desc = 'Open cargo.toml',
            },
            {
                '<Leader>lj',
                function()
                    vim.cmd.RustLsp({ 'moveItem', 'down' })
                end,
                ft = 'rust',
                desc = 'Move item down',
            },
            {
                '<Leader>lk',
                function()
                    vim.cmd.RustLsp({ 'moveItem', 'up' })
                end,
                ft = 'rust',
                desc = 'Move item up',
            },
            {
                '<Leader>lu',
                function()
                    vim.cmd.RustLsp('parentModule')
                end,
                ft = 'rust',
                desc = 'Open parent module',
            },
            {
                '<Leader>lb',
                function()
                    vim.cmd.RustLsp('renderDiagnostic')
                end,
                ft = 'rust',
                desc = 'Render diagnostics',
            },
            {
                '<Leader>lE',
                function()
                    vim.cmd.RustLsp('explainError')
                end,
                ft = 'rust',
                desc = 'Explain error',
            },
            {
                '<Leader>lB',
                function()
                    vim.cmd.RustLsp('rebuildProcMacros')
                end,
                ft = 'rust',
                desc = 'Rebuild proc macros',
            },
            {
                '<Leader>lt',
                function()
                    vim.cmd.RustLsp('syntaxTree')
                end,
                ft = 'rust',
                desc = 'View syntax tree',
            },
            {
                '<Leader>ln',
                function()
                    vim.cmd.RustLsp('relatedDiagnostics')
                end,
                ft = 'rust',
                desc = 'Related diagnostics',
            },
            {
                '<Leader>lx',
                function()
                    vim.cmd.RustLsp('openDocs')
                end,
                ft = 'rust',
                desc = 'Open docs.rs',
            },
        },
        dependencies = { 'saghen/blink.cmp' },
        init = function()
            vim.g.rustaceanvim = {
                tools = {
                    float_win_config = {
                        border = 'rounded',
                    },
                },
            }
        end,
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
