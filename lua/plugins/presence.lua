return {
    'vyfor/cord.nvim',
    branch = 'client-server',
    build = ':Cord fetch',
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
            },
        },
    },
}
