vim.bo.formatexpr = ''

vim.keymap.set('n', 'gO', function()
    Snacks.picker.lsp_symbols()
end, { desc = 'Overview', buffer = true })
