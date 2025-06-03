return {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = true,
    ft = 'markdown',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'echasnovski/mini.nvim',
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        heading = {
            enabled = false,
            sign = true,
            icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' },
            width = 'full',
        },
        code = {
            enabled = false,
            sign = false,
            style = 'normal',
            width = 'block',
            min_width = 80,
            border = 'thick',
        },
        sign = {
            enabled = false,
        },
        latex = { enabled = false },
        bullet = {
            enabled = false,
            icons = { '●' },
            -- icons = { '●', '■', '◆' },
        },
        checkbox = {
            enabled = false,
        },
        link = {
            enabled = true,
            wiki = {
                icon = '',
            },
        },
        quote = {
            icon = '▌',
        },
        completions = { lsp = { enabled = true } },
    },
}
