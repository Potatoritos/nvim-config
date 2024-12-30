return {
    'vyfor/cord.nvim',
    branch = 'client-server',
    build = ':Cord update',
    event = 'VeryLazy',
    opts = {
        editor = {
            client = 'neovim',
            tooltip = 'hiya!! (≧▽≦) /',
        },
        display = {
            theme = 'onyx',
        },
        advanced = {
            plugin = {
                log_level = vim.log.levels.OFF,
                cursor_update_mode = 'none',
            },
        },
    },
}
