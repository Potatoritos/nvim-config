return {
    'stevearc/oil.nvim',
    keys = {
        {
            '<F2>',
            '<cmd>Oil<CR>',
            mode = 'n',
        },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        default_file_explorer = true,
        columns = {
            'icon',
            -- 'size',
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = false,
        view_options = {
            show_hidden = true,
        },
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
}
