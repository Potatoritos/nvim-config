return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        heading = {
            enabled = true,
            sign = true,
            icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' },
            width = 'full',
            border = false,
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
    },
}
