return {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    keys = {
        {
            '<leader>lt',
            '<cmd>TypstPreviewToggle<CR>',
            mode = 'n',
            ft = 'typst',
        },
    },
    opts = {
        invert_colors = '{"rest":"always","image":"never"}',
        dependencies_bin = {
            ['tinymist'] = vim.fn.expand('~/.cargo/bin/tinymist'),
        },
        get_root = function(_)
            return vim.fn.expand('~/notes/')
        end,
    },
}
