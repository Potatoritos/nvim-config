require('nabla').enable_virt()

-- vim.keymap.set('n', '<leader>n', function() require('nabla').popup() end, { desc = 'View latex as ascii' })

vim.keymap.set('n', '<leader>n', function()
    require('nabla').toggle_virt()
end, { desc = 'Toggle nabla virtual lines' })

vim.api.nvim_create_autocmd('BufWritePost', {
    desc = 'Reload nabla virtual lines on save',
    group = vim.api.nvim_create_augroup('nabla-reload-virt-save', { clear = true }),
    callback = function()
        local nabla = require('nabla')
        if nabla.is_virt_enabled() then
            nabla.disable_virt()
            nabla.enable_virt()
        end
    end
})

vim.keymap.set('n', '<leader>j', '<cmd>ObsidianFollowLink<CR>', { desc = 'Follow link' })
vim.keymap.set('n', '<leader>v', '<cmd>ObsidianFollowLink vsplit<CR>', { desc = 'Open link in vsplit' })
vim.keymap.set('n', '<leader>h', '<cmd>ObsidianFollowLink hsplit<CR>', { desc = 'Open link in hsplit' })
vim.keymap.set('n', '<leader>s', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Switch to another note' })
vim.keymap.set('n', '<leader>o', '<cmd>ObsidianOpen<CR>', { desc = 'Open note in obsidian' })

