local function pick_tabpages()
    local tabpages = vim.api.nvim_list_tabpages()
    local items = {}
    for _, id in ipairs(tabpages) do
        local number = vim.api.nvim_tabpage_get_number(id)
        items[number] = id
    end

    local format = function(id)
        local windows = vim.api.nvim_tabpage_list_wins(id)
        local active_win = vim.api.nvim_tabpage_get_win(id)

        local details = {}

        for _, winid in ipairs(windows) do
            local buf = vim.api.nvim_win_get_buf(winid)
            local name = vim.api.nvim_buf_get_name(buf)
            name = vim.fn.fnamemodify(name, ':t')

            if winid == active_win then
                table.insert(details, '[' .. name .. ']')
            else
                table.insert(details, name)
            end
        end

        return table.concat(details, ', ')
    end

    Snacks.picker.select(items, {
        prompt = 'Tabpages',
        format_item = format,
    }, function(choice)
        if choice ~= nil then
            vim.api.nvim_set_current_tabpage(choice)
        end
    end)
end

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
        { '<Leader>sp', pick_tabpages, desc = 'Tabpages' },
        { '<Leader>sr', function() Snacks.picker.registers() end, desc = 'Registers' },
        { '<Leader>su', function() Snacks.picker.undo() end, desc = 'Undo history' },
        { '<Leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git log line' },
        { '<Leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git stash' },
        { '<Leader>gB', function() Snacks.picker.git_branches() end, desc = 'Git branches' },
        { '<Leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git diff (hunks)' },
        { '<Leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git log file' },
        { '<Leader>gl', function() Snacks.picker.git_log() end, desc = 'Git log' },
        { '<Leader>gs', function() Snacks.picker.git_status() end, desc = 'Git status' },
        { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto defintion' },
        { 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto declaration' },
        { 'grr', function() Snacks.picker.lsp_references() end, desc = 'References' },
        { 'gri', function() Snacks.picker.lsp_implementations() end, desc = 'Implementations' },
        { 'gO', function() Snacks.picker.lsp_symbols() end, desc = 'LSP symbols' },
        { '<leader>lw', function() Snacks.picker.lsp_workspace_symbols({ live = false }) end, desc = 'Workspace symbols (static)' },
        { '<leader>lW', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'Workspace symbols (live)' },
        { '<Leader>T', function() Snacks.explorer() end, desc = 'Toggle file tree' },
        { '<Leader>S', function() Snacks.scratch() end, desc = 'Toggle scratch buffer' },
        { '<F3>', function() Snacks.terminal.toggle() end, desc = 'Toggle terminal', mode = { 'n', 't' } },
        { '<F7>', function() Snacks.lazygit() end, desc = 'Lazygit', mode = { 'n', 't' } },
        { '<Leader>gx', function() Snacks.gitbrowse.open() end, desc = 'Open repo in browser' },
    },
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
        bigfile = {},
        explorer = {},
        gitbrowse = {},
        image = {
            doc = {
                conceal = false,
            },
            math = {
                enabled = true,
            },
            convert = {
                magick = {
                    vector = { '-density', 192, '{src}[0]', '-background', 'none', '-transparent', 'white' },
                },
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
        'echasnovski/mini.nvim',
    },
}
