return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
        labels = 'asdfghjkl;qwertyuiopzxcvbnm',
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
            'r',
            mode = 'o',
            function()
                require('flash').remote()
            end,
            desc = 'Remote',
        },
        {
            '<Leader>t',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').treesitter()
            end,
            desc = 'Select treesitter node',
        },
    },
}
