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
    TERM = 'blue'
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
                name = require('feline.providers.vi_mode').get_mode_highlight_name()
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
    },
	git_diff_added = {
		provider = 'git_diff_added',
		hl = {
			fg = 'cyan',
			bg = 'bg',
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
		},
        icon = '~',
		left_sep = 'block',
		right_sep = 'block',
	},
    diagnostic_errors = {
        provider = 'diagnostic_errors',
        hl = {
            fg = 'pink',
            bg = 'bg',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    diagonstic_warnings = {
        provider = 'diagnostic_warnings',
        hl = {
            fg = 'cyan',
            bg = 'bg',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    diagnostic_hints = {
        provider = 'diagnostic_hints',
        hl = {
            fg = 'darkfg',
            bg = 'bg',
        },
        left_sep = 'block',
        right_sep = 'block',
    },
    file_info = {
        provider = {
            name = 'file_info',
            opts = {
                type = 'relative-short',
            },
        },
        hl = {
            bg = 'bg',
            fg = 'fg',
        },
        left_sep = ' ',
        right_sep = ' ',
    },
    file_encoding = {
		provider = 'file_encoding',
		hl = {
			fg = 'darkfg',
			bg = 'bg',
		},
		left_sep = 'block',
		right_sep = 'block',
	},
	position = {
		provider = 'position',
		hl = {
			fg = 'darkfg',
			bg = 'bg',
		},
		left_sep = 'block',
		right_sep = 'block',
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

