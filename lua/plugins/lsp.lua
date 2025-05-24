return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^6',
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
