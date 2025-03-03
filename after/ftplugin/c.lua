vim.opt_local.commentstring = '// %s'
vim.keymap.set('n', '<Leader>lh', '<Cmd>ClangdSwitchSourceHeader<CR>', {
    desc = 'Switch source/header',
    buffer = true,
})
