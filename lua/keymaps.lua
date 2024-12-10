vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

vim.keymap.set('n', '<leader>h', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<leader>l', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { desc = 'Focus upper window' })

vim.keymap.set('n', '<leader>f', '<cmd>HopWord<CR>', { desc = 'Hop to word' })
vim.keymap.set('n', '<leader>p', '<cmd>HopPattern<CR>', { desc = 'Hop to pattern' })

vim.keymap.set('n', '<leader>c', '<cmd>ColorizerToggle<CR>', { desc = 'Toggle colorizer' })
vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle comment', remap = true })
vim.keymap.set('v', '<leader>/', '<ESC>gvgc', { desc = 'Toggle comment', remap = true })

vim.keymap.set('n', '<F1>', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>')
vim.keymap.set('n', '<F2>', '<cmd>Telescope buffers<CR>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', 'ZZ', '')
