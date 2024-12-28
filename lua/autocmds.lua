vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd('BufWritePre', {
--     desc = 'Format on save',
--     group = vim.api.nvim_create_augroup('format-on-save', { clear = true }),
--     callback = function()
--         if vim.lsp.buf.format ~= nil then
--             vim.lsp.buf.format()
--         end
--     end
-- })
