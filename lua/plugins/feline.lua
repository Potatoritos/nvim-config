local line_colors = {
    fg = COLORS.fg,
    darkfg = COLORS.darkfg,
    bg = COLORS.bg,
    lightbg = COLORS.lightbg,
    pink = COLORS.pink,
    darkpink = COLORS.darkpink,
    blue = COLORS.blue,
    blue2 = COLORS.blue2,
    cyan = COLORS.cyan,
    green = COLORS.green,
    purple = COLORS.purple,
}

local mode_colors = {
    NORMAL = 'pink',
    INSERT = 'blue2',
    REPLACE = 'blue',
    VISUAL = 'darkpink',
    COMMAND = 'purple',
    LINES = 'darkpink',
    BLOCK = 'darkpink',
    OP = 'cyan',
    SELECT = 'cyan',
    TERM = 'blue',
}

local line = {
    vim_mode = {
        provider = {
            name = 'vi_mode',
            opts = {
                show_mode_name = true,
            },
        },
        hl = function()
            return {
                fg = 'bg',
                bg = require('feline.providers.vi_mode').get_mode_color(),
                style = 'bold',
                name = require('feline.providers.vi_mode').get_mode_highlight_name(),
            }
        end,
        left_sep = 'block',
        right_sep = 'block',
        icon = '',
    },
    git_branch = {
        provider = 'git_branch',
        hl = {
            bg = 'bg',
            fg = 'darkfg',
        },
        left_sep = 'block',
        right_sep = 'block',
        truncate_hide = true,
        priority = 3,
    },
    git_diff_added = {
        provider = 'git_diff_added',
        hl = {
            fg = 'cyan',
            bg = 'bg',
            style = 'bold',
        },
        icon = '+',
        left_sep = 'block',
        right_sep = 'block',
    },
    git_diff_removed = {
        provider = 'git_diff_removed',
        hl = {
            fg = 'darkfg',
            bg = 'bg',
            style = 'bold',
        },
        icon = '-',
        left_sep = 'block',
        right_sep = 'block',
    },
    git_diff_changed = {
        provider = 'git_diff_changed',
        hl = {
            fg = 'pink',
            bg = 'bg',
            style = 'bold',
        },
        icon = '~',
        left_sep = 'block',
        right_sep = 'block',
    },
    diagnostic_errors = {
        provider = 'diagnostic_errors',
        hl = {
            fg = 'darkpink',
            bg = 'bg',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
        icon = ' ',
    },
    diagonstic_warnings = {
        provider = 'diagnostic_warnings',
        hl = {
            fg = 'purple',
            bg = 'bg',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
        icon = ' ',
    },
    diagnostic_hints = {
        provider = 'diagnostic_hints',
        hl = {
            fg = 'darkfg',
            bg = 'bg',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
        icon = '󰌵 ',
    },
    file_info = {
        provider = {
            name = 'file_info',
            opts = {
                type = 'relative',
                file_readonly_icon = '',
            },
        },
        short_provider = {
            name = 'file_info',
            opts = {
                type = 'relative-short',
                file_readonly_icon = '',
            },
        },
        hl = {
            bg = 'bg',
            fg = 'fg',
        },
        left_sep = 'block',
        right_sep = 'block',
        priority = 0,
    },
    file_encoding = {
        provider = 'file_encoding',
        hl = {
            fg = 'darkfg',
            bg = 'bg',
        },
        left_sep = 'block',
        right_sep = 'block',
        truncate_hide = true,
        priority = 1,
    },
    position = {
        provider = 'position',
        hl = {
            fg = 'darkfg',
            bg = 'bg',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
        truncate_hide = true,
        priority = 2,
    },
    line_percentage = {
        provider = 'line_percentage',
        hl = {
            fg = 'darkpink',
            bg = 'bg',
            style = 'bold',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
}

local left = {
    line.vim_mode,
    line.file_info,
    line.git_diff_added,
    line.git_diff_removed,
    line.git_diff_changed,
}

local middle = {}

local right = {
    line.diagnostic_errors,
    line.diagonstic_warnings,
    line.diagnostic_hints,
    line.git_branch,
    line.file_encoding,
    line.position,
    line.line_percentage,
}

local components = {
    active = {
        left,
        middle,
        right,
    },
    inactive = {
        left,
        middle,
        right,
    },
}

return {
    'freddiehaddad/feline.nvim',
    opts = {
        components = components,
        theme = line_colors,
        vi_mode_colors = mode_colors,
    },
}
