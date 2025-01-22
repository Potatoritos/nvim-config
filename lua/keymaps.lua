vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit file' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })

vim.keymap.set({ 'n', 'o' }, "'", '`', { desc = 'Jump to mark', remap = true })

vim.keymap.set('n', '<leader>lr', function()
    vim.ui.input({ prompt = 'New name: ' }, function(input)
        if input ~= nil and input ~= '' then
            vim.lsp.buf.rename(input)
        end
    end)
end, { desc = 'Rename (LSP)' })
vim.keymap.set('n', '<leader>la', function()
    vim.lsp.buf.code_action()
end, { desc = 'Code action (LSP)' })
vim.keymap.set('n', 'gd', function()
    vim.lsp.buf.definition()
end, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>ld', function()
    vim.diagnostic.open_float()
end, { desc = 'Show diagnostics float' })

vim.keymap.set('n', '<leader>vp', '`[v`]', { desc = 'Select last change' })

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
