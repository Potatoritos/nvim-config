return {
    {
        'rmagatti/auto-session',
        lazy = false,
        ---@module 'auto-session'
        ---@type AutoSession.Config
        opts = {
            allowed_dirs = {
                '~/p/*',
                '~/.config/nvim',
            },
        },
    },
    {
        'lervag/vimtex',
        lazy = false,
        config = function()
            vim.g.vimtex_syntax_enabled = 0
        end,
    },
    {
        'nyoom-engineering/oxocarbon.nvim',
    },
    {
        'nvim-tree/nvim-web-devicons',
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
        keys = {
            {
                '<leader>c',
                '<cmd>ColorizerToggle<CR>',
                mode = 'n',
                desc = 'Toggle colorizer',
            },
        },
        opts = {},
    },
}
