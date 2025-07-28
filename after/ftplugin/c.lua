vim.opt_local.commentstring = '// %s'
vim.keymap.set('n', '<Leader>lh', '<Cmd>LspClangdSwitchSourceHeader<CR>', {
    desc = 'Switch source/header',
    buffer = true,
})
