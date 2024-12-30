require('nabla').enable_virt({ autogen = true })

-- vim.keymap.set('n', '<leader>n', function() require('nabla').popup() end, { desc = 'View latex as ascii' })

vim.keymap.set('n', '<leader>n', function()
    require('nabla').toggle_virt({ autogen = true })
end, { desc = 'Toggle nabla virtual lines', buffer = true })

vim.keymap.set('n', '<leader>j', '<cmd>ObsidianFollowLink<CR>',
    { desc = 'Follow link', buffer = true})
vim.keymap.set('n', '<leader>l', '<cmd>ObsidianLinks<CR>',
    { desc = 'Pick buffer links', buffer = true })
vim.keymap.set('n', '<leader>b', '<cmd>ObsidianBacklinks<CR>',
    { desc = 'Pick backlinks', buffer = true })
vim.keymap.set('n', '<leader>o', '<cmd>ObsidianOpen<CR>',
    { desc = 'Open note in obsidian', buffer = true })
vim.keymap.set('n', '<F8>', '<cmd>ObsidianQuickSwitch<CR>',
    { desc = 'Switch to note', buffer = true })

vim.keymap.set('n', '<leader>x', function()
    require('obsidian').util.toggle_checkbox()
end, { desc = 'Toggle checkbox', buffer = true })

vim.keymap.set('v', '<leader>n', '<cmd>ObsidianLinkNew<CR>',
    { desc = 'Create and link note', buffer = true})
