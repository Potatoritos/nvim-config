return {
    'stevearc/oil.nvim',
    lazy = false,
    keys = {
        {
            '<Leader>o',
            '<Cmd>Oil<CR>',
            desc = 'Oil',
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
        'echasnovski/mini.nvim',
    },
}
