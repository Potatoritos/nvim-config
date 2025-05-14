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
        {
            '<Leader>a',
            function()
                require('flash').jump({
                    action = function(match, state)
                        vim.api.nvim_win_call(match.win, function()
                            vim.api.nvim_win_set_cursor(match.win, match.pos)
                            vim.lsp.buf.definition()
                        end)
                        state:restore()
                    end,
                })
            end,
            desc = 'Goto definition (remote)',
        },
    },
}
