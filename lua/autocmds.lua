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

vim.api.nvim_create_autocmd('TabEnter', {
    desc = 'Display tab number',
    group = vim.api.nvim_create_augroup('display-tab-number', { clear = true }),
    callback = function()
        local tabid = vim.api.nvim_get_current_tabpage()
        local tabs = vim.api.nvim_list_tabpages()
        local chunks = {}
        for _, id in ipairs(tabs) do
            local num = vim.api.nvim_tabpage_get_number(id)
            local win = vim.api.nvim_tabpage_get_win(id)
            local buf = vim.api.nvim_win_get_buf(win)
            local name = vim.api.nvim_buf_get_name(buf)
            local n = vim.fn.fnamemodify(name, ':t')

            if name == '' then
                name = '---'
            elseif n ~= '' then
                name = n
            end

            if name:len() > 12 then
                name = name:sub(1, 11) .. '…'
            end

            if id == tabid then
                table.insert(chunks, { '[', 'TabpageActive' })
                table.insert(chunks, { '' .. num, 'TabpageActive' })
                table.insert(chunks, { ' ' .. name .. ']', 'TabpageActive' })
            else
                table.insert(chunks, { ' ', 'TabpageInactive' })
                table.insert(chunks, { '' .. num, 'TabpageInactive' })
                table.insert(chunks, { ' ' .. name .. ' ', 'TabpageInactive' })
            end
        end
        vim.api.nvim_echo(chunks, false, {})
    end,
})
