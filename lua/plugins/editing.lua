return {
    {
        'echasnovski/mini.ai',
        version = false,
        config = function()
            local ai = require('mini.ai')
            ai.setup({
                custom_textobjects = {
                    b = false,
                    q = false,
                    ['$'] = ai.gen_spec.pair('$', '$', { type = 'greedy' }),
                },
                mappings = {
                    around_next = '',
                    inside_next = '',
                    around_last = '',
                    inside_last = '',
                },
            })
        end,
    },
    {
        'ggandor/leap.nvim',
        lazy = false,
        config = function()
            local leap = require('leap')
            leap.opts.case_sensitive = true
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
    },
}
