return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        icons = {
            mappings = true,
            keys = {},
        },
        preset = 'helix',
        plugins = {
            marks = false,
            registers = false,
        },
        triggers = {
            { '<leader>', mode = { 'n', 'v' } },
        },
    },
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Keymaps (buffer)',
        },
    },
}
