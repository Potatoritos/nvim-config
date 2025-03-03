vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>', { desc = 'Save' })

vim.keymap.set({ 'n', 'x', 'o' }, "'", '`', { desc = 'Jump to mark' })

vim.keymap.set('n', '<Leader>lr', function()
    vim.lsp.buf.rename()
end, { desc = 'Rename' })
vim.keymap.set('n', '<Leader>la', function()
    vim.lsp.buf.code_action()
end, { desc = 'Code action' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- enable lazyredraw, disable autocmds during macro execution
vim.keymap.set('n', '@', function()
    local count = vim.v.count1
    local register = vim.fn.getcharstr()
    local lazyredraw = vim.opt.lazyredraw
    vim.opt.lazyredraw = true
    vim.api.nvim_command(string.format('noa norm! %d@%s', count, register))
    vim.opt.lazyredraw = lazyredraw
end, { noremap = true })

vim.keymap.set('n', '<Leader>st', function()
    require('templates').insert_template()
end, { desc = 'Templates' })
