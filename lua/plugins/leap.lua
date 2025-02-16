return {
    'ggandor/leap.nvim',
    lazy = false,
    config = function()
        local leap = require('leap')
        leap.opts.case_sensitive = true
        leap.opts.safe_labels = 'fnut/FNLHMUGTZ?'
        vim.keymap.set({ 'n', 'x', 'o' }, '<Leader>f', '<Plug>(leap-forward)', { desc = 'Leap forward' })
        vim.keymap.set({ 'n', 'x', 'o' }, '<Leader>F', '<Plug>(leap-backward)', { desc = 'Leap backward' })
        vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)', { desc = 'Leap all windows' })
    end,
}
