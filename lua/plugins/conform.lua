return {
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
            c = { 'clang-format' },
            cpp = { 'clang-format' },
            javascript = { 'prettierd' },
            lua = { 'stylua' },
            python = { 'isort', 'black' },
            rust = { lsp_format = 'first' },
            typescript = { 'prettierd' },
            vue = { 'prettierd' },
        },
        formatters = {
            ['clang-format'] = {
                prepend_args = {
                    '--style={"PenaltyReturnTypeOnItsOwnLine":1000,"BinPackParameters":false,"BinPackArguments":false,"AlignAfterOpenBracket":"BlockIndent","IndentWidth":4,"AllowShortFunctionsOnASingleLine":"Empty"}',
                },
            },
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
}
