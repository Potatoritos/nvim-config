local blacklist = {
    'notes',
}

local is_blacklisted = function(opts)
    return vim.tbl_contains(blacklist, opts.workspace_name)
end

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
        text = {
            viewing = function(opts)
                return is_blacklisted(opts) and 'Viewing a file' or ('Viewing ' .. opts.filename)
            end,
            editing = function(opts)
                return is_blacklisted(opts) and 'Editing a file' or ('Editing ' .. opts.filename)
            end,
            workspace = function(opts)
                return 'Workspace: ' .. opts.workspace_name
            end,
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
