return {
    'akinsho/toggleterm.nvim',
    version = '*',
    event = 'VimEnter',
    keys = {
        '<F3>',
        {
            '<F4>',
            '<Cmd>TermExec cmd="cld %"<CR>',
            mode = 'n',
            ft = 'cpp',
        },
    },
    opts = {
        size = 20,
        open_mapping = '<F3>',
        shade_terminals = false,
        highlights = {
            Normal = {
                guifg = COLORS.darkfg,
            },
        },
    },
}
