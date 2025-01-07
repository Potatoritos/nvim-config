return {
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            {
                '<leader>lf',
                function()
                    require('conform').format({ async = true })
                end,
                mode = 'n',
                desc = 'Format buffer',
            },
        },
        ---@module 'conform'
        ---@type conform.setupOpts
        opts = {
            formatters_by_ft = {
                c = { lsp_format = 'first' },
                cpp = { lsp_format = 'first' },
                javascript = { 'prettierd' },
                lua = { 'stylua' },
                markdown = { 'prettierd' },
                python = { 'isort', 'black' },
                rust = { lsp_format = 'first' },
                typescript = { 'prettierd' },
                vue = { 'prettierd' },
            },
            default_format_opts = {
                lsp_format = 'fallback',
            },
            format_on_save = {
                lsp_format = 'fallback',
                timeout_ms = 500,
            },
            log_level = vim.log.levels.DEBUG,
        },
        init = function()
            vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
        end,
    },
    {
        'zapling/mason-conform.nvim',
        dependencies = {
            'stevearc/conform.nvim',
            'williamboman/mason.nvim',
        },
        opts = {},
    },
}
