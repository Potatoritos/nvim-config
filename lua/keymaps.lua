vim.keymap.set('t', '<C-Space>', '<C-\\><C-n>', { desc = 'Escape terminal' })
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Clear highlights' })
vim.keymap.set('n', '<Leader>w', '<Cmd>update<CR>', { desc = 'Save' })

local function enabled_status(s, enabled)
    vim.api.nvim_echo({ { ('%s: %s'):format(s, enabled and 'on' or 'off') } }, false, {})
end

vim.keymap.set('n', '<Leader>S', function()
    vim.o.spell = not vim.o.spell
    enabled_status('Spellcheck', vim.o.spell)
end, { desc = 'Toggle spellcheck' })

vim.keymap.set('n', '<Leader>h', function()
    local enabled = not vim.lsp.inlay_hint.is_enabled()
    vim.lsp.inlay_hint.enable(enabled)
    enabled_status('Inlay hints', enabled)
end, { desc = 'Toggle inlay hints' })

vim.keymap.set('n', '<Leader>d', function()
    local enabled = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = enabled })
    enabled_status('Diagnostic virtual lines', enabled)
end, { desc = 'Toggle diagnostic virtual lines' })

vim.keymap.set('n', '<Leader>C', function()
    if vim.b.completion == nil then
        vim.b.completion = false
    else
        vim.b.completion = not vim.b.completion
    end
    enabled_status('Completion', vim.b.completion)
end, { desc = 'Toggle completion' })

-- enable lazyredraw, disable autocmds during macro execution
vim.keymap.set('n', '@', function()
    local count = vim.v.count1
    local register = vim.fn.getcharstr()
    local lazyredraw = vim.opt.lazyredraw
    vim.opt.lazyredraw = true
    vim.api.nvim_command(string.format('noa norm! %d@%s', count, register))
    vim.opt.lazyredraw = lazyredraw
end, { noremap = true })

vim.keymap.set(
    'n',
    '<Leader>st',
    function() require('templates').insert_template() end,
    { desc = 'Templates' }
)
