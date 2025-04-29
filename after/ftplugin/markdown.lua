vim.keymap.set('n', '<Leader>ld', '<Cmd>Daily today<CR>', { desc = 'Today', buffer = true })
vim.keymap.set('n', '<Leader>lt', '<Cmd>Daily tomorrow<CR>', { desc = 'Tomorrow', buffer = true })
vim.keymap.set('n', '<Leader>ly', '<Cmd>Daily yesterday<CR>', { desc = 'Yesterday', buffer = true })
vim.keymap.set('n', '<Leader>lf', '<Esc>:Daily ', { desc = ':Daily ...', buffer = true })
vim.keymap.set('n', '<Leader>lo', '<Cmd>e todo.md<CR>', { desc = 'Open todo', buffer = true })

vim.bo.formatexpr = ''

vim.keymap.set('n', 'gO', function()
    Snacks.picker.lsp_symbols()
end, { desc = 'Overview', buffer = true })
