vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<Leader>q', '<Cmd>q<CR>', { desc = 'Quit' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus upper window' })

vim.keymap.set({ 'n', 'o' }, "'", '`', { desc = 'Jump to mark', remap = true })

vim.keymap.set('n', '<Leader>st', function()
    require('templates').insert_template()
end, { desc = 'Templates' })

vim.keymap.set('n', '<Leader>lr', function()
    vim.lsp.buf.rename()
end, { desc = 'Rename' })
vim.keymap.set('n', '<Leader>la', function()
    vim.lsp.buf.code_action()
end, { desc = 'Code action' })
vim.keymap.set('n', '<Leader>lf', function()
    vim.diagnostic.open_float()
end, { desc = 'Show diagnostics float' })
vim.keymap.set('n', '<Leader>lh', '<Cmd>ClangdSwitchSourceHeader<CR>', { desc = 'Switch source/header' })

vim.keymap.set('n', '<Leader>vp', '`[v`]', { desc = 'Select last change' })

vim.keymap.set('n', '<Leader>tn', '<Cmd>tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<Leader>tq', '<Cmd>tabclose<CR>', { desc = 'Quit tab' })

-- enable lazyredraw, disable autocmds during macro execution
vim.keymap.set('n', '@', function()
    local count = vim.v.count1
    local register = vim.fn.getcharstr()
    local lazyredraw = vim.opt.lazyredraw
    vim.opt.lazyredraw = true
    vim.api.nvim_command(string.format('noa norm! %d@%s', count, register))
    vim.opt.lazyredraw = lazyredraw
end, { noremap = true })

vim.keymap.set('n', '<F12>', '<Cmd>Lazy<CR>', { desc = 'Open Lazy menu' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', 'ZZ', '')
