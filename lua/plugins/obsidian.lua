return {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    event = {
        'BufReadPre /home/potatoritos/notes/*.md',
        'BufNewFile /home/potatoritos/notes/*.md',
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'ibhagwan/fzf-lua',
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        workspaces = {
            {
                name = 'notes',
                path = '~/notes',
            },
        },
        completion = {
            nvim_cmp = false,
        },
        picker = {
            name = 'fzf-lua',
        },
        ui = {
            bullets = { hl_group = 'RenderMarkdownBullet' },
            external_link_icon = { char = '' },
            hl_groups = {
                ObsidianTodo = { fg = 'NONE', bg = 'NONE' },
                ObsidianDone = { fg = 'NONE', bg = 'NONE' },
                ObsidianBullet = { fg = 'NONE', bg = 'NONE' },
                ObsidianRefText = { fg = 'NONE', bg = 'NONE' },
                ObsidianHighlightText = { fg = 'NONE', bg = 'NONE' },
            },
        },
    },
    config = function(_, opts)
        require('obsidian').setup(opts)

        -- manually register sources until obsidian.nvim supports blink.cmp
        local cmp = require('cmp')
        cmp.register_source('obsidian', require('cmp_obsidian').new())
        cmp.register_source('obsidian_new', require('cmp_obsidian_new').new())
        cmp.register_source('obsidian_tags', require('cmp_obsidian_tags').new())
    end,
}
