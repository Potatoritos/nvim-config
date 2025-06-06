return {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    keys = {
        {
            '<Leader>lt',
            '<Cmd>TypstPreviewToggle<CR>',
            mode = 'n',
            ft = 'typst',
            desc = 'Toggle typst preview',
        },
    },
    opts = {
        invert_colors = '{"rest":"always","image":"never"}',
        dependencies_bin = {
            ['tinymist'] = vim.fn.stdpath('data') .. '/mason/bin/tinymist',
        },
        open_cmd = nil,
        port = 1273,
        -- get_root = function(_)
        --     return vim.fn.expand('~/notes/')
        -- end,
    },
}
