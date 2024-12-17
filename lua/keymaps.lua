vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })

vim.keymap.set('n', '<leader>f', '<cmd>HopWord<CR>', { desc = 'Hop to word' })

vim.keymap.set('n', '<leader>c', '<cmd>ColorizerToggle<CR>', { desc = 'Toggle colorizer' })

vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle comment', remap = true })
vim.keymap.set('v', '<leader>/', '<ESC>gvgc', { desc = 'Toggle comment', remap = true })

vim.keymap.set('n', '\'', '`', { desc = 'Jump to mark', remap = true })
vim.keymap.set('o', '\'', '`', { desc = 'To mark', remap = true })

-- vim.keymap.set('n', '<S-h>', '^', { desc = 'Start of line', remap = true })
-- vim.keymap.set('n', '<S-l>', '$', { desc = 'End of line', remap = true })

vim.keymap.set('n', '<leader>ta', '<cmd>Trouble diagnostics toggle<CR>',
    { desc = 'Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>tb', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
    { desc = 'Buffer Diagnostics (Trouble)' })

vim.keymap.set('n', '<F1>', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>')
vim.keymap.set('n', '<F2>', '<cmd>Telescope buffers<CR>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', 'ZZ', '')

