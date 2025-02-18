vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual' })
    end,
})

local function set_fold_hl()
    local nf = vim.api.nvim_get_hl(0, { name = 'NormalFloat', link = false })
    local comment = vim.api.nvim_get_hl(0, { name = 'Comment', link = false })
    vim.api.nvim_set_hl(0, 'FoldedIcon', { fg = nf.bg })
    vim.api.nvim_set_hl(0, 'FoldedText', { bg = nf.bg, fg = comment.fg, italic = true })
end

set_fold_hl()

vim.api.nvim_create_autocmd('ColorScheme', {
    callback = set_fold_hl,
})

-- Auto resize splits when the terminal's window is resized
-- vim.api.nvim_create_autocmd('VimResized', {
--     command = 'wincmd =',
-- })

-- function _G.set_terminal_keymaps()
--     local opts = { buffer = 0 }
--     vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--     vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--     vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--     vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- end
--
-- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
