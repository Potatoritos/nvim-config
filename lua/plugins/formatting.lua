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
                lua = { 'stylua' },
                python = { 'isort', 'black' },
                javascript = { 'prettierd' },
                typescript = { 'prettierd' },
            },
            default_format_opts = {
                lsp_format = 'fallback',
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = 'never',
            },
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
