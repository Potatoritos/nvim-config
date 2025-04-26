vim.keymap.set('n', '<Leader>dd', '<Cmd>Daily today<CR>', { desc = 'Today', buffer = true })
vim.keymap.set('n', '<Leader>dt', '<Cmd>Daily tomorrow<CR>', { desc = 'Tomorrow', buffer = true })
vim.keymap.set('n', '<Leader>dy', '<Cmd>Daily yesterday<CR>', { desc = 'Yesterday', buffer = true })
vim.keymap.set('n', '<Leader>df', '<Esc>:Daily ', { desc = ':Daily ...', buffer = true })
vim.keymap.set('n', '<Leader>do', '<Cmd>e todo.md<CR>', { desc = 'Open todo', buffer = true })

vim.bo.formatexpr = ''
