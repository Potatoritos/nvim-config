---@diagnostic disable missing-fields

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit file' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })
vim.keymap.set('n', '<leader>s', '<C-w>s', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Vertical split' })

vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle comment', remap = true })
vim.keymap.set('v', '<leader>/', '<Esc>gvgc', { desc = 'Toggle comment', remap = true })

vim.keymap.set({ 'n', 'o' }, "'", '`', { desc = 'Jump to mark', remap = true })

vim.keymap.set('n', '<leader>lr', function()
    vim.lsp.buf.rename()
end, { desc = 'Rename (LSP)' })
vim.keymap.set('n', '<leader>la', function()
    vim.lsp.buf.code_action()
end, { desc = 'Code action (LSP)' })

vim.keymap.set('n', 'gp', '`[v`]', { desc = 'Select last paste' })
vim.keymap.set('n', 'ga', 'ggVG', { desc = 'Select all' })

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>Y', '"+Y', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>P', '"+P', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>D', '"+D', { noremap = true, silent = true })

-- enable lazyredraw, disable autocmds during macro execution
vim.keymap.set('n', '@', function()
    local count = vim.v.count1
    local register = vim.fn.getcharstr()
    local lazyredraw = vim.opt.lazyredraw
    vim.opt.lazyredraw = true
    vim.api.nvim_command(string.format('noa norm! %d@%s', count, register))
    vim.opt.lazyredraw = lazyredraw
end, { noremap = true })

vim.keymap.set('n', '<F12>', '<cmd>Lazy<CR>', { desc = 'Open Lazy menu' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', 'ZZ', '')
