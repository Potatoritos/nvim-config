local function config()
    local conditions = require('heirline.conditions')
    local utils = require('heirline.utils')

    local function setup_colors()
        local function hl(name)
            local h = utils.get_highlight(name)
            if next(h) == nil then
                return utils.get_highlight('StatusLine')
            end
            return h
        end
        return {
            normal_fg = hl('StatusNormal').fg,
            insert_fg = hl('StatusInsert').fg,
            visual_fg = hl('StatusVisual').fg,
            command_fg = hl('StatusCommand').fg,
            select_fg = hl('StatusSelect').fg,
            replace_fg = hl('StatusReplace').fg,
            terminal_fg = hl('StatusTerminal').fg,
            fg_secondary = hl('NonText').fg,
            fg = hl('StatusLine').fg,
            bg = hl('StatusLine').bg,
            add = hl('DiffAdd').fg,
            change = hl('DiffChange').fg,
            delete = hl('DiffDelete').fg,
            info = hl('DiagnosticInfo').fg,
            hint = hl('DiagnosticHint').fg,
            warn = hl('DiagnosticWarn').fg,
            error = hl('DiagnosticError').fg,
            ruler = hl('DiagnosticError').fg,
        }
    end

    local window_number = {
        init = function(self) self.number = vim.api.nvim_win_get_number(0) end,
        condition = conditions.is_not_active,
        provider = function(self) return ('N(%d)'):format(self.number) end,
        hl = {
            fg = 'normal_fg',
            bg = 'bg',
            bold = true,
        },
    }

    local function is_file()
        return not conditions.buffer_matches({
            buftype = { 'nofile' },
        })
    end

    local vi_mode = {
        init = function(self) self.mode = vim.fn.mode(1) end,
        condition = conditions.is_active,
        update = { 'ModeChanged' },
        static = {
            mode_names = {
                n = 'N',
                v = 'V',
                V = 'V',
                ['\22'] = 'V',
                s = 'S',
                ['\19'] = 'S',
                i = 'I',
                R = 'R',
                c = 'C',
                r = '-',
                ['!'] = '!',
                t = 'T',
            },
            mode_colors = {
                n = 'normal',
                i = 'insert',
                v = 'visual',
                ['\22'] = 'visual',
                c = 'command',
                s = 'select',
                ['\19'] = 'select',
                r = 'replace',
                t = 'terminal',
            },
        },
        provider = function(self)
            return ('%s(%d)'):format(
                self.mode_names[self.mode:sub(1, 1)],
                vim.api.nvim_win_get_number(0)
            )
        end,
        hl = function(self)
            local color = self.mode_colors[self.mode:sub(1, 1):lower()]
            if color == nil then
                return { fg = 'fg', bg = 'bg' }
            end
            return { fg = color .. '_fg', bg = 'bg', bold = true }
        end,
    }

    local align = {
        provider = ' %= ',
    }

    local file_icon = {
        init = function(self)
            local icon, hl, is_default = require('mini.icons').get('file', self.filename)
            if is_default then
                icon, hl, is_default = require('mini.icons').get('filetype', vim.bo.filetype)
                if is_default and vim.bo.buftype == 'terminal' then
                    icon, hl = '', 'MiniIconsPurple'
                end
            end

            self.icon, self.icon_hl = icon, hl
        end,
        provider = function(self) return ' ' .. self.icon end,
        hl = function(self) return { fg = utils.get_highlight(self.icon_hl).fg, bg = 'bg' } end,
    }

    local file_name = {
        init = function(self)
            if self.filename == '' then
                self.file, self.directory = '[No Name]', ''
                return
            end

            local path = self.filename
            if path:match('^oil://') then
                path = path:sub(7)
            elseif path:match('^term://') then
                path = path:sub(8)
            end

            local filename = vim.fn.fnamemodify(path, ':~:.')
            if filename == '' then
                filename = vim.fn.fnamemodify(path, ':~')
            end

            local index = filename:find('/[^/]*$') or 0

            self.directory = filename:sub(1, index)
            self.file = filename:sub(index + 1)
        end,
        hl = { fg = 'fg', bg = 'bg' },
        { provider = ' ' },
        {
            flexible = 2,
            { provider = function(self) return self.directory end },
            { provider = function(self) return vim.fn.pathshorten(self.directory) end },
            hl = { fg = 'fg_secondary' },
        },
        {
            provider = function(self) return self.file end,
        },
    }

    local file_flags = {
        hl = { fg = 'fg', bg = 'bg' },
        {
            condition = function() return vim.bo.modified end,
            provider = ' ' .. SYMBOLS.changed,
        },
        {
            condition = function() return not vim.bo.modifiable or vim.bo.readonly end,
            provider = ' ' .. SYMBOLS.readonly,
        },
    }

    local file_name_block = {
        init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
        condition = is_file,
        file_icon,
        file_name,
        file_flags,
    }

    local file_encoding = {
        condition = function()
            local enc = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
            return enc ~= 'utf-8'
        end,
        hl = { fg = 'fg', bg = 'bg', italic = true },
        provider = function() return ' ' .. (vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc) .. ' ' end,
    }

    local word_count = {
        condition = function()
            return conditions.buffer_matches({
                filetype = { 'markdown' },
            })
        end,
        -- update = { 'BufEnter', 'InsertLeave' },
        hl = { fg = 'fg', bg = 'bg' },
        flexible = 3,
        {
            provider = function()
                local count = vim.fn.wordcount()
                local mode = vim.fn.mode()
                if mode == 'v' or mode == 'V' or mode == '\22' then
                    return (' %d/%d words '):format(count.visual_words, count.words)
                end
                return (' %d words '):format(count.words)
            end,
        },
        { provider = '' },
    }

    local git_branch = {
        condition = function()
            return vim.b.minigit_summary ~= nil and vim.b.minigit_summary.head_name ~= nil
        end,
        update = { 'User', pattern = 'MiniGitUpdated' },
        flexible = 4,
        {
            provider = function(self)
                return ' ' .. SYMBOLS.branch .. ' ' .. vim.b.minigit_summary.head_name .. ' '
            end,
        },
        {
            provider = ' ' .. SYMBOLS.branch .. ' ',
        },
        hl = { fg = 'fg', bg = 'bg' },
    }

    local git_changes = {
        condition = function() return vim.b.minidiff_summary ~= nil end,
        hl = { bold = true, bg = 'bg' },
        {
            provider = function(self)
                local count = vim.b.minidiff_summary.add or 0
                return count > 0 and (' +' .. count)
            end,
            hl = { fg = 'add' },
        },
        {
            provider = function(self)
                local count = vim.b.minidiff_summary.delete or 0
                return count > 0 and (' -' .. count)
            end,
            hl = { fg = 'delete' },
        },
        {
            provider = function(self)
                local count = vim.b.minidiff_summary.change or 0
                return count > 0 and (' ~' .. count)
            end,
            hl = { fg = 'change' },
        },
    }

    local position = {
        provider = ' %6(%l:%c%) ',
        hl = { fg = 'fg', bg = 'bg' },
    }

    local ruler = {
        static = {
            sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' },
        },
        {
            provider = ' %P ',
        },
        {
            provider = function(self)
                local curr_line = vim.api.nvim_win_get_cursor(0)[1]
                local lines = vim.api.nvim_buf_line_count(0)
                local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
                return self.sbar[i]
            end,
            hl = { fg = 'ruler', bg = '#5c2f42' },
        },
        hl = { fg = 'ruler', bg = 'bg', bold = true },
    }

    local diagnostics = {
        condition = conditions.has_diagnostics,

        init = function(self)
            self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
            self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
            self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
            self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        end,

        update = { 'DiagnosticChanged', 'BufEnter' },
        hl = { bg = 'bg' },
        {
            provider = function(self)
                return self.errors > 0 and (SYMBOLS.error .. self.errors .. ' ')
            end,
            hl = { fg = 'error' },
        },
        {
            provider = function(self)
                return self.warnings > 0 and (SYMBOLS.warn .. self.warnings .. ' ')
            end,
            hl = { fg = 'warn' },
        },
        {
            provider = function(self) return self.info > 0 and (SYMBOLS.info .. self.info .. ' ') end,
            hl = { fg = 'info' },
        },
        {
            provider = function(self) return self.hints > 0 and (SYMBOLS.hint .. self.hints .. ' ') end,
            hl = { fg = 'hint' },
        },
    }

    local lsp_active = {
        condition = conditions.lsp_attached,
        flexible = 3,
        {
            update = { 'LspAttach', 'LspDetach' },
            {
                provider = function()
                    local names = {}
                    for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
                        table.insert(names, server.name)
                    end
                    return ' ' .. SYMBOLS.lsp .. ' ' .. table.concat(names, ' ') .. ' '
                end,
            },
        },
        {
            update = { 'LspAttach', 'LspDetach' },
            {
                provider = ' ' .. SYMBOLS.lsp .. ' ',
            },
        },
        hl = { fg = 'fg', bg = 'bg' },
    }

    local tabpage = {
        init = function(self)
            local win = vim.api.nvim_tabpage_get_win(self.tabpage)
            local buf = vim.api.nvim_win_get_buf(win)
            self.filename = vim.api.nvim_buf_get_name(buf)
            if self.filename == '' then
                self.filename = '---'
            end

            local filename = self.filename
            self.icon, self.icon_hl = require('mini.icons').get('file', filename)
        end,
        {
            provider = function(self) return ' ' .. self.tabnr .. ' ' end,
            hl = { bold = true },
        },
        {
            provider = function(self)
                local name = vim.fn.fnamemodify(self.filename, ':t')
                if name == '' then
                    name = self.filename
                end
                if name:len() >= 17 then
                    name = name:sub(1, 15) .. '…'
                end
                return name .. '  '
            end,
            hl = { bold = false },
        },
        hl = function(self)
            if self.is_active then
                return { fg = 'fg', bg = 'bg' }
            else
                return { fg = 'fg_secondary', bg = 'bg' }
            end
        end,
    }

    local tabline = {
        condition = function() return #vim.api.nvim_list_tabpages() >= 2 end,
        utils.make_tablist(tabpage),
    }

    require('heirline').setup({
        ---@diagnostic disable-next-line: missing-fields
        statusline = {
            window_number,
            vi_mode,
            file_name_block,
            git_changes,
            align,
            diagnostics,
            -- lsp_active,
            git_branch,
            word_count,
            file_encoding,
            position,
            ruler,
        },
        tabline = tabline,
        opts = {
            colors = setup_colors(),
        },
    })
    vim.api.nvim_create_augroup('Heirline', { clear = true })
    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function() utils.on_colorscheme(setup_colors) end,
        group = 'Heirline',
    })
end

return {
    'rebelot/heirline.nvim',
    event = 'UiEnter',
    config = config,
    dependencies = {
        'echasnovski/mini.nvim',
    },
}
