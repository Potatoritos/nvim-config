return {
    'Wansmer/treesj',
    keys = {
        {
            '<leader>j',
            function() require('treesj').toggle() end,
            mode = 'n',
            desc = 'Split/join',
        },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
        use_default_keymaps = false,
        max_join_length = 120,
        notify = false,
    },
}
