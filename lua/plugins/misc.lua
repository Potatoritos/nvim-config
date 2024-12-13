return {
    {
        'smoka7/hop.nvim',
        version = '*',
        opts = {
            keys = 'sdklqwertyuiopzxcvnmbhgfja;',
        },
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            open_mapping = '<F3>',
        },
    },
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
        },
        opts = {
            workspaces = {
                {
                    name = 'notes',
                    path = '~/notes',
                },
            },
        },
    },
    {
        'jbyuki/nabla.nvim',
        ft = 'markdown',
        config = function()
            require('nabla').enable_virt()
        end
    },
    {
        'nyoom-engineering/oxocarbon.nvim'
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },
    {
        'nvim-tree/nvim-web-devicons'
    },
    {
        'folke/which-key.nvim',
        event = 'VimEnter',
        opts = {
            icons = {
                mappings = true,
                keys = {},
            },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },
    {
        'norcalli/nvim-colorizer.lua',
        opts = {},
    },
}
