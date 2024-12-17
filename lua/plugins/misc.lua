return {
    {
        'smoka7/hop.nvim',
        version = '*',
        opts = {
            keys = 'sdklqwertyuiopzxcvnmbhgfja;',
        },
    },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        event = {
            'InsertEnter',
            'VeryLazy',
        },
        config = function()
            require('luasnip.loaders.from_snipmate').lazy_load()
        end,
    },
    {
        'folke/trouble.nvim',
        opts = {},
        cmd = 'Trouble',
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            open_mapping = '<F3>',
        },
    },
    {
        'lervag/vimtex',
        lazy = false,
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
        event = 'VeryLazy',
        opts = {
            icons = {
                mappings = true,
                keys = {},
            },
        },
    },
    {
        'norcalli/nvim-colorizer.lua',
        opts = {},
    },
}

