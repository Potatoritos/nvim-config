return {
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    enabled = false,
    keys = {
        {
            '<Leader>gb',
            '<Cmd>Gitsigns blame<CR>',
            mode = 'n',
            desc = 'Git blame',
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
