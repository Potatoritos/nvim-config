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

vim.keymap.set('n', '<leader>f', '<cmd>HopWord<CR>', { desc = 'Hop to word' })

vim.keymap.set('n', '<leader>c', '<cmd>ColorizerToggle<CR>', { desc = 'Toggle colorizer' })

vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle comment', remap = true })
vim.keymap.set('v', '<leader>/', '<Esc>gvgc', { desc = 'Toggle comment', remap = true })

vim.keymap.set({ 'i', 'n' }, '<C-p>', function()
    require('nvim-autopairs').toggle()
end, { desc = 'Toggle autopairs' })

vim.keymap.set('n', '<leader>P', 'ggVG"+p', { remap = true })
vim.keymap.set('n', '<leader>J', '[{a<CR><Esc>]}i<CR><Esc>kg_a <Esc>"_D',
    { desc = '{x} -> {↵x↵}', remap = true })

vim.keymap.set({ 'n', 'o' }, '\'', '`', { desc = 'Jump to mark', remap = true })

vim.keymap.set('n', '<leader>p', function()
    if vim.lsp.buf.format ~= nil then
        vim.lsp.buf.format({ async = true })
    end
end, { desc = 'Format buffer' })

vim.keymap.set('n', '<leader>x', function()
    local word = vim.fn.expand('<cword>')
    local replace = {
        ['true'] = 'false',
        ['false'] = 'true',
        ['True'] = 'False',
        ['False'] = 'True',
    }
    local res = replace[word]
    if res == nil then
        return ''
    end
    return string.format('ciw%s<Esc>', res)
end, { expr = true, desc = 'Toggle boolean' })

-- enable lazyredraw, disable autocmds during macro execution
vim.keymap.set('n', '@', function()
    local count = vim.v.count1
    local register = vim.fn.getcharstr()
    local lazyredraw = vim.opt.lazyredraw
    vim.opt.lazyredraw = true
    vim.api.nvim_command(string.format('noa norm! %d@%s', count, register))
    vim.opt.lazyredraw = lazyredraw
end, { noremap = true })

vim.keymap.set('i', '<Tab>', function()
    local ls = require('luasnip')
    if ls.expandable() then
        ls.expand()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
    end
end, { silent = true })

vim.keymap.set('n', '<leader>ta', '<cmd>Trouble diagnostics toggle<CR>',
    { desc = 'Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>tb', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
    { desc = 'Buffer Diagnostics (Trouble)' })

vim.keymap.set('n', '<F1>', function()
    require('fzf-lua').files({
        fzf_colors = true,
        actions = {
            ['ctrl-h'] = {
                function(_, args)
                    if args.cmd:find('--hidden') then
                        args.cmd = args.cmd:gsub('--hidden', '', 1)
                    else
                        args.cmd = args.cmd .. ' --hidden'
                    end
                    require('fzf-lua').files(args)
                end
            }
        }
    })
end)
vim.keymap.set('n', '<F2>', '<cmd>Oil<CR>')
vim.keymap.set('n', '<F3>', function()
    require('fzf-lua').buffers({ fzf_colors = true })
end)
vim.keymap.set('n', '<F8>', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Switch to note (Obsidian)' })
vim.keymap.set('n', '<F11>', function()
    require('luasnip.loaders.from_snipmate').lazy_load()

    require('luasnip.loaders.from_lua').load({
        ---@diagnostic disable-next-line: assign-type-mismatch
        paths = '~/.config/nvim/snippets'
    })
end, { desc = 'Reload snippets' })
vim.keymap.set('n', '<F12>', '<cmd>Lazy<CR>', { desc = 'Open Lazy menu' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', 'ZZ', '')
