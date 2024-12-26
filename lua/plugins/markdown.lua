return {
    {
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
                bullets = { hl_group = 'MarkviewListItemMinus' },
                external_link_icon = { char = '' },
                reference_text = { hl_group = 'MarkviewHyperlink' },
                highlight_text = { hl_group = 'MdHighlight' },
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
    },
    {
        'jbyuki/nabla.nvim',
        ft = 'markdown',
    },
    {
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
                sign = false,
                icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' },
                width = 'full',
                border = false,
            },
            code = {
                enabled = true,
                sign = false,
                style = 'normal',
                width = 'block',
                min_width = 50,
            },
            sign = {
                enabled = false,
            },
            latex = {
                enabled = true,
            },
            bullet = {
                enabled = true,
                icons = { '●' },
                -- icons = { '●', '■', '◆' },
            },
            win_options = {
                conceallevel = {
                    default = vim.api.nvim_get_option_value('conceallevel', {}),
                    rendered = 2,
                },
            },
        },
    }
}

