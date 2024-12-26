return {
    -- {
    --     'epwalsh/obsidian.nvim',
    --     version = '*',
    --     lazy = true,
    --     event = {
    --         'BufReadPre /home/potatoritos/notes/*.md',
    --         'BufNewFile /home/potatoritos/notes/*.md',
    --     },
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'ibhagwan/fzf-lua',
    --         'nvim-treesitter/nvim-treesitter',
    --     },
    --     opts = {
    --         workspaces = {
    --             {
    --                 name = 'notes',
    --                 path = '~/notes',
    --             },
    --         },
    --         completion = {
    --             nvim_cmp = true,
    --         },
    --         picker = {
    --             name = 'fzf-lua',
    --         },
    --         ui = {
    --             bullets = { hl_group = 'MarkviewListItemMinus' },
    --             external_link_icon = { char = '' },
    --             reference_text = { hl_group = 'MarkviewHyperlink' },
    --             highlight_text = { hl_group = 'MdHighlight' },
    --         },
    --     },
    -- },
    {
        'jbyuki/nabla.nvim',
        ft = 'markdown',
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
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

