return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
        modes = {
            char = {
                enabled = false,
            },
        },
        prompt = {
            enabled = false,
        },
    },
    keys = {
        {
            '<Leader>f',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').jump()
            end,
            desc = 'Flash',
        },
        {
            '<Leader>st',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').treesitter()
            end,
            desc = 'Select treesitter',
        },
    },
}
