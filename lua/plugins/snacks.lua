return {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    -- stylua: ignore
    keys = {
        { '<Leader>sb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
        { '<Leader>sc', function() Snacks.picker.command_history() end, desc = 'Command history' },
        { '<Leader>sC', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes' },
        { '<Leader>sd', function() Snacks.picker.diagnostics_buffer() end, desc = 'Diagnostics (buffer)' },
        { '<Leader>sD', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics (all buffers)' },
        { '<Leader>sf', function() Snacks.picker.files() end, desc = 'Files' },
        { '<Leader>sF', function() Snacks.picker.git_files() end, desc = 'Files (git)' },
        { '<Leader>sg', function() Snacks.picker.grep() end, desc = 'Grep' },
        { '<Leader>sh', function() Snacks.picker.help() end, desc = 'Help pages' },
        { '<Leader>sH', function() Snacks.picker.highlights() end, desc = 'Highlights' },
        { '<Leader>sj', function() Snacks.picker.jumps() end, desc = 'Jumps' },
        { '<Leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
        { '<Leader>sl', function() Snacks.picker.lines() end, desc = 'Lines (buffer)' },
        { '<Leader>sL', function() Snacks.picker.grep_buffers() end, desc = 'Lines (all buffers)' },
        { '<Leader>sm', function() Snacks.picker.marks() end, desc = 'Marks' },
        { '<Leader>sn', function() Snacks.picker.notifications() end, desc = 'Notification history' },
        { '<Leader>sr', function() Snacks.picker.registers() end, desc = 'Registers' },
        { '<Leader>su', function() Snacks.picker.undo() end, desc = 'Undo history' },
        { '<Leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git log line' },
        { '<Leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git stash' },
        { '<Leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git branches' },
        { '<Leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git diff (hunks)' },
        { '<Leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git log file' },
        { '<Leader>gl', function() Snacks.picker.git_log() end, desc = 'Git log' },
        { '<Leader>gs', function() Snacks.picker.git_status() end, desc = 'Git status' },
        { '<Leader>ld', function() Snacks.picker.lsp_definitions() end, desc = 'Definitions' },
        { '<Leader>lD', function() Snacks.picker.lsp_declarations() end, desc = 'Declarations' },
        { '<Leader>lR', function() Snacks.picker.lsp_references() end, desc = 'References' },
        { '<Leader>li', function() Snacks.picker.lsp_implementations() end, desc = 'Implementations' },
        { '<Leader>ls', function() Snacks.picker.lsp_symbols() end, desc = 'Symbols' },
        { '<leader>lw', function() Snacks.picker.lsp_workspace_symbols({ live = false }) end, desc = 'Workspace symbols (static)' },
        { '<leader>lW', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'Workspace symbols (live)' },
        { '<Leader>tr', function() Snacks.explorer() end, desc = 'Toggle file tree' },
        { '<Leader>S', function() Snacks.scratch() end, desc = 'Toggle scratch buffer' },
        { '<F3>', function() Snacks.terminal.toggle() end, desc = 'Toggle terminal', mode = { 'n', 't' } },
        { '<F7>', function() Snacks.lazygit() end, desc = 'Lazygit', mode = { 'n', 't' } },
        { '<Leader>go', function() Snacks.gitbrowse.open() end, desc = 'Open repo (browser)' },
    },
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
        bigfile = {},
        dashboard = {
            enabled = false,
            width = 40,
            preset = {
                keys = {
                    {
                        icon = '󱞩 ',
                        key = 'r',
                        desc = 'Restore session',
                        action = ':SessionRestore',
                    },
                    {
                        icon = ' ',
                        key = 'f',
                        desc = 'Find session',
                        action = ':SessionSearch',
                    },
                    {
                        icon = ' ',
                        key = 'i',
                        desc = 'New buffer',
                        action = ':ene | startinsert',
                    },
                    {
                        icon = '󰒲 ',
                        key = 'p',
                        desc = 'Plugins',
                        action = ':Lazy',
                    },
                    {
                        icon = ' ',
                        key = 'c',
                        desc = 'Config',
                        action = ':cd' .. vim.fn.stdpath('config') .. ' | SessionRestore',
                    },
                    {
                        icon = '󰎚 ',
                        key = 'n',
                        desc = 'Notes',
                        action = ':cd ~/notes | SessionRestore',
                    },
                    {
                        icon = ' ',
                        key = 'q',
                        desc = 'Quit',
                        action = ':qa',
                    },
                },
            },
            sections = {
                { text = { { 'NVIM v' .. tostring(vim.version()) } } },
                function()
                    local path = vim.fn.getcwd():gsub('^' .. vim.fn.expand('~'), '~')
                    if #path > 40 then
                        path = path:sub(1, 39) .. '…'
                    end
                    return { text = { { path } }, padding = 1 }
                end,
                { section = 'keys', padding = 1 },
            },
        },
        explorer = {},
        gitbrowse = {},
        image = {
            doc = {
                conceal = false,
            },
        },
        input = {},
        lazygit = {},
        picker = {
            layout = {
                layout = {
                    backdrop = false,
                },
            },
            win = {
                input = {
                    keys = {
                        ['<Leader>f'] = { 'flash' },
                    },
                },
            },
            actions = {
                flash = function(picker)
                    require('flash').jump({
                        pattern = '^',
                        label = { after = { 0, 0 } },
                        search = {
                            mode = 'search',
                            exclude = {
                                function(win)
                                    return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'snacks_picker_list'
                                end,
                            },
                        },
                        action = function(match)
                            local idx = picker.list:row2idx(match.pos[1])
                            picker.list:_move(idx, true, true)
                        end,
                    })
                end,
            },
            ---@diagnostic disable-next-line: missing-fields
            icons = {
                diagnostics = {
                    Error = SYMBOLS.error,
                    Warn = SYMBOLS.warn,
                    Hint = SYMBOLS.hint,
                    Info = SYMBOLS.info,
                },
                kinds = KIND_ICONS,
            },
        },
        scratch = {},
        -- statuscolumn = {
        --     left = { 'sign', 'mark' },
        --     right = { 'fold', 'git' },
        --     folds = {
        --         open = false,
        --         git_hl = false,
        --     },
        -- },
        terminal = {},
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
}
