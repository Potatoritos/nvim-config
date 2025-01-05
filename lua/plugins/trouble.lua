return {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
        {
            '<leader>ta',
            '<cmd>Trouble diagnostics toggle<CR>',
            mode = 'n',
            desc = 'Diagnostics',
        },
        {
            '<leader>tb',
            '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>',
            mode = 'n',
            desc = 'Buffer diagnostics',
        },
    },
}
