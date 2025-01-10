return {
    {
        'smoka7/hop.nvim',
        version = '*',
        event = 'VeryLazy',
        keys = {
            {
                '<leader>f',
                '<cmd>HopWord<CR>',
                mode = 'n',
                desc = 'Hop to word',
            },
        },
        opts = {
            keys = 'sdklqwertyuiopzxcvnmbhgfja;',
        },
    },
    {
        'kylechui/nvim-surround',
        version = '*',
        event = {
            'BufReadPost',
            'BufNewFile',
            'VeryLazy',
        },
        opts = {
            move_cursor = 'sticky',
        },
    },
    {
        'Wansmer/treesj',
        event = 'VeryLazy',
        keys = {
            {
                '<leader>j',
                function()
                    require('treesj').toggle({
                        join = {
                            space_in_brackets = true,
                        },
                    })
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
    },
}
