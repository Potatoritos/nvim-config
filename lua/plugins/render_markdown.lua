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
            enabled = true,
            sign = false,
            style = 'normal',
            width = 'block',
            min_width = 80,
            border = 'thick',
        },
        sign = {
            enabled = true,
        },
        latex = { enabled = false },
        bullet = {
            enabled = true,
            icons = { '●' },
            -- icons = { '●', '■', '◆' },
        },
        link = {
            enabled = true,
            wiki = {
                icon = '',
            },
        },
        -- win_options = {
        --     conceallevel = {
        --         -- default = vim.api.nvim_get_option_value('conceallevel', {}),
        --         rendered = 2,
        --     },
        -- },
    },
}
