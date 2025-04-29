vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>', { desc = 'Save' })

vim.keymap.set('n', '<Leader>h', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })

vim.keymap.set('n', '<Leader>d', function()
    local virtual_lines = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = virtual_lines })
end, { desc = 'Toggle diagnostic virtual lines' })

vim.keymap.set('n', '<Leader>H', function()
    vim.o.list = not vim.o.list
end, { desc = 'Toggle listchars' })

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
