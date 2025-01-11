return {
    {
        'ggandor/leap.nvim',
        lazy = false,
        config = function()
            vim.keymap.set({ 'n', 'x', 'o' }, '<leader>f', '<Plug>(leap-forward)', { desc = 'Leap forward' })
            vim.keymap.set({ 'n', 'x', 'o' }, '<leader>s', '<Plug>(leap-backward)', { desc = 'Leap backward' })
            vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)', { desc = 'Leap all windows' })
        end,
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
