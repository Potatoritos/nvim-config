return {
    'Wansmer/treesj',
    event = {
        'BufNewFile',
        'BufReadPost',
        'VeryLazy',
    },
    keys = {
        {
            '<leader>j',
            function()
                require('treesj').toggle()
            end,
            mode = 'n',
            desc = 'Join block',
        },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
        use_default_keymaps = false,
        max_join_length = 120,
        notify = false,
    },
}
