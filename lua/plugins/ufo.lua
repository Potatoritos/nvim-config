local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' +%d lines '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { ' ', 'FoldedIcon' })
    table.insert(newVirtText, { suffix, 'FoldedText' })
    table.insert(newVirtText, { ' ', 'FoldedIcon' })
    return newVirtText
end

return {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    enabled = true,
    config = function()
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        ---@diagnostic disable-next-line: missing-fields
        require('ufo').setup({
            provider_selector = function(_, filetype, _)
                local use_lsp = {
                    'cpp',
                    'lua',
                    'rust',
                    'javascript',
                    'javascriptreact',
                    'typescript',
                    'typescriptreact',
                    'vue',
                }
                if vim.tbl_contains(use_lsp, filetype) then
                    return { 'lsp', 'indent' }
                end
                return { 'treesitter', 'indent' }
            end,
            close_fold_kinds_for_ft = {
                default = {},
            },
            open_fold_hl_timeout = 0,
            fold_virt_text_handler = handler,
        })
    end,
}
