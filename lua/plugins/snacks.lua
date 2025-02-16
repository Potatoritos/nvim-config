return {
    'folke/snacks.nvim',
    keys = {
        {
            '<Leader>ef',
            function()
                Snacks.picker.files()
            end,
            desc = 'Files',
        },
        {
            '<Leader>et',
            function()
                Snacks.explorer()
            end,
            desc = 'File tree',
        },
        {
            '<Leader>eh',
            function()
                Snacks.picker.highlights()
            end,
        },
    },
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
        picker = {},
    },
}
