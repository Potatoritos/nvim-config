return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<Leader>lf',
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
            javascript = { 'biome' },
            json = { lsp_format = 'never' },
            lua = { 'stylua' },
            python = { 'isort', 'black' },
            rust = { lsp_format = 'prefer' },
            typescript = { 'biome' },
            typst = { lsp_format = 'prefer' },
            vue = { 'biome' },
        },
        formatters = {
            ['clang-format'] = {
                prepend_args = {
                    '--style={"PenaltyReturnTypeOnItsOwnLine":1000,"BreakTemplateDeclarations":"Yes","BinPackParameters":false,"BinPackArguments":false,"AlignAfterOpenBracket":"BlockIndent","IndentWidth":4,"AllowShortFunctionsOnASingleLine":"Empty"}',
                },
            },
            ['biome'] = {
                append_args = {
                    '--indent-style=space',
                },
            },
        },
        default_format_opts = {
            lsp_format = 'never',
        },
        format_on_save = {
            timeout_ms = 500,
        },
        log_level = vim.log.levels.DEBUG,
    },
    init = function()
        vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
    end,
}
