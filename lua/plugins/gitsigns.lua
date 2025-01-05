return {
    'lewis6991/gitsigns.nvim',
    keys = {
        {
            '<leader>b',
            '<cmd>Gitsigns toggle_current_line_blame<CR>',
            mode = 'n',
            desc = 'Toggle git blame',
        },
    },
    opts = {
        signs = {
            changedelete = { text = '' },
        },
        signs_staged = {
            changedelete = { text = '' },
        },
        current_line_blame_opts = {
            delay = 100,
        },
    },
}
