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
            'hrsh7th/nvim-cmp',
            'nvim-telescope/telescope.nvim',
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
                nvim_cmp = true,
                min_chars = 1,
            },
            picker = {
                name = 'telescope.nvim',
            },
            ui = {
                bullets = { hl_group = 'MarkviewListItemMinus' },
                external_link_icon = { char = '' },
                reference_text = { hl_group = 'MarkviewHyperlink' },
                highlight_text = { hl_group = 'MdHighlight' },
            },
        },
    },
    {
        'jbyuki/nabla.nvim',
        ft = 'markdown',
    },
    {
        'OXY2DEV/markview.nvim',
        lazy = false,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            headings = {
                enable = true,
                heading_1 = { style = 'simple' },
                heading_2 = { style = 'simple' },
                heading_3 = { style = 'simple' },
                heading_4 = { style = 'simple' },
                heading_5 = { style = 'simple' },
                heading_6 = { style = 'simple' },
            },
            filetypes = { 'markdown' },
            code_blocks = {
                enable = true,
                style = 'language',
                sign = false,
                icons = 'internal',
            },
            latex = { enable = false },
            links = {
                enable = true,
                hyperlinks = {
                    enable = true,
                    icon = '',
                },
                internal_links = {
                    enable = true,
                    icon = '',
                },
            },
            list_items = {
                enable = true,
                indent_size = 4,
            },
        },
    },
}

