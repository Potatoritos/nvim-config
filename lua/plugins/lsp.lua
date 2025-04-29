local function ls_setup()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local lsp = require('lspconfig')
    local util = require('lspconfig.util')
    lsp.basedpyright.setup({})
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

                vim.lsp
                    .get_clients({ name = 'markdown_oxide' })[1]
                    :exec_cmd({ command = 'jump', arguments = { input }, title = 'daily note' })
            end, { desc = 'Open daily note', nargs = '*' })
        end,
    })
    lsp.clangd.setup({
        cmd = {
            'clangd',
            '--header-insertion=never',
        },
    })
    lsp.tinymist.setup({
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
        root_dir = function(fname)
            return util.root_pattern('biome.json', 'biome.jsonc')(fname)
                or find('package.json', fname)
                or find('node_modules', fname)
                or find('.git', fname)
        end,
    })
    lsp.lua_ls.setup({})
    lsp.vtsls.setup({
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
        config = ls_setup,
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
