return {
    'vyfor/cord.nvim',
    build = './build || .\\build',
    event = 'VeryLazy',
    opts = {
        usercmds = false,
        log_level = 'error',
        timer = {
            interval = 2000,
            reset_on_idle = false,
            reset_on_change = false,
        },
        editor = {
            client = 'neovim',
            tooltip = 'hiya!! (≧▽≦) /',
        },
        display = {
            show_time = true,
            show_repository = true,
            show_cursor_position = false,
            swap_fields = false,
            swap_icons = false,
            workspace_blacklist = {},
        },
        lsp = {
            show_problem_count = false,
            scope = 'workspace',
        },
        idle = {
            enable = true,
            show_status = true,
            timeout = 600000,
            disable_on_focus = false,
            text = 'Idle',
            tooltip = 'zzzzz',
        },
        text = {
            viewing = 'Viewing {}',
            editing = 'Editing {}',
            file_browser = '',
            plugin_manager = '',
            lsp_manager = '',
            vcs = '',
            workspace = 'In {}',
        },
        buttons = {
            label = 'View Repository',
            url = 'git',
        },
    },
}
