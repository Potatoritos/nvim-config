return {
    'kylechui/nvim-surround',
    version = '*',
    event = {
        'BufReadPost',
        'BufNewFile',
        'VeryLazy',
    },
    opts = {
        move_cursor = 'sticky',
    },
}
