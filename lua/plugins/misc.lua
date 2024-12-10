return {
    {
        'smoka7/hop.nvim',
        version = '*',
        opts = {
            keys = 'sdklqwertyuiopzxcvbnmhgfja;',
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
