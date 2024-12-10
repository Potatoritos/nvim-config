return {
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        opts = {
            defaults = {
                layout_config = {
                    height = 0.7,
                    width = 0.618,
                    preview_width = 0.5,
                    prompt_position = 'top',
                },
                sorting_strategy = 'ascending',
                prompt_prefix = '-> ',
                selection_caret = '* ',
            },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
        },
    },
}
