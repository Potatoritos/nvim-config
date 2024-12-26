require('nabla').enable_virt({ autogen = true })

-- vim.keymap.set('n', '<leader>n', function() require('nabla').popup() end, { desc = 'View latex as ascii' })

vim.keymap.set('n', '<leader>n', function()
    require('nabla').toggle_virt({ autogen = true })
end, { desc = 'Toggle nabla virtual lines' })

vim.keymap.set('n', '<leader>j', '<cmd>ObsidianFollowLink<CR>', { desc = 'Follow link' })
vim.keymap.set('n', '<leader>v', '<cmd>ObsidianFollowLink vsplit<CR>', { desc = 'Open link in vsplit' })
vim.keymap.set('n', '<leader>h', '<cmd>ObsidianFollowLink hsplit<CR>', { desc = 'Open link in hsplit' })
vim.keymap.set('n', '<leader>o', '<cmd>ObsidianOpen<CR>', { desc = 'Open note in obsidian' })

