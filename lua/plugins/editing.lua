return {
    {
        'smoka7/hop.nvim',
        version = '*',
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
        event = 'VeryLazy',
        opts = {
            move_cursor = 'sticky',
        },
    },
    {
        'Wansmer/treesj',
        keys = {
            {
                '<leader>j',
                function()
                    require('treesj').join()
                end,
                mode = 'n',
                desc = 'Join block',
            },
            {
                '<leader>k',
                function()
                    require('treesj').split()
                end,
                mode = 'n',
                desc = 'Split block',
            },
        },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
            use_default_keymaps = false,
        },
    },
}
