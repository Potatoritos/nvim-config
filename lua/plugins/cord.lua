return {
    'vyfor/cord.nvim',
    build = ':Cord update',
    event = 'VeryLazy',
    opts = {
        log_level = vim.log.levels.OFF,
        editor = {
            client = 'neovim',
            tooltip = 'hiya!! (≧▽≦) /',
        },
        text = {
            viewing = 'Viewing text',
            editing = 'Editing text',
            workspace = function(opts) return 'Workspace: ' .. opts.workspace end,
        },
        advanced = {
            plugin = {
                cursor_update_mode = 'none',
            },
            workspace = {
                root_markers = {
                    '.moxide.toml',
                    '.git',
                },
                limit_to_cwd = true,
            },
        },
    },
}
