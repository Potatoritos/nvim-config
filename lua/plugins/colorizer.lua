return {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    keys = {
        {
            '<leader>c',
            '<cmd>ColorizerToggle<CR>',
            mode = 'n',
            desc = 'Toggle colorizer',
        },
    },
    opts = {},
}
