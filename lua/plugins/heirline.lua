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
            normal_bg = hl('StatusNormal').bg,
            insert_fg = hl('StatusInsert').fg,
            insert_bg = hl('StatusInsert').bg,
            visual_fg = hl('StatusVisual').fg,
            visual_bg = hl('StatusVisual').bg,
            command_fg = hl('StatusCommand').fg,
            command_bg = hl('StatusCommand').bg,
            select_fg = hl('StatusSelect').fg,
            select_bg = hl('StatusSelect').bg,
            replace_fg = hl('StatusReplace').fg,
            replace_bg = hl('StatusReplace').bg,
            terminal_fg = hl('StatusTerminal').fg,
            terminal_bg = hl('StatusTerminal').bg,
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
        init = function(self)
            self.number = vim.api.nvim_win_get_number(0)
        end,
        condition = conditions.is_not_active,
        provider = function(self)
            return '--' .. self.number .. '--'
        end,
        hl = {
            fg = 'normal_fg',
            bg = 'normal_bg',
            bold = true,
        },
    }

    local function is_file()
        return not conditions.buffer_matches({
            buftype = { 'nofile' },
        })
    end

    local function not_file()
        return conditions.buffer_matches({
            buftype = { 'nofile' },
        })
    end

    local function not_file_tree()
        return not conditions.buffer_matches({
            filetype = { 'snacks_layout_box' },
        })
    end

    local vi_mode_update = {
        'ModeChanged',
        pattern = '*:*',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
    }

    local vi_mode = {
        init = function(self)
            self.mode = vim.fn.mode(1)
        end,
        condition = conditions.is_active,
        static = {
            mode_names = {
                n = 'N',
                no = 'N',
                nov = 'N',
                noV = 'N',
                ['no\22'] = 'N',
                niI = 'N',
                niR = 'N',
                niV = 'N',
                nt = 'N',
                v = 'V',
                vs = 'V',
                V = 'V',
                Vs = 'V',
                ['\22'] = 'V',
                ['\22s'] = 'V',
                s = 'S',
                S = 'S',
                ['\19'] = 'S',
                i = 'I',
                ic = 'I',
                ix = 'I',
                R = 'R',
                Rc = 'R',
                Rx = 'R',
                Rv = 'R',
                Rvc = 'R',
                Rvx = 'R',
                c = 'C',
                cv = 'X',
                r = '-',
                rm = '-',
                ['r?'] = '?',
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
        {
            update = vi_mode_update,
            provider = function(self)
                -- return '->N'
                return '--' .. self.mode_names[self.mode] .. '--'
            end,
        },
        hl = function(self)
            local color = self.mode_colors[self.mode:sub(1, 1):lower()]
            if color == nil then
                return { fg = 'fg', bg = 'bg' }
            end
            return { fg = color .. '_fg', bg = color .. '_bg', bold = true }
        end,
    }

    local align = {
        provider = '%=',
    }

    local file_icon = {
        init = function(self)
            local filename = self.filename
            self.icon, self.icon_hl = require('mini.icons').get('file', filename)
        end,
        provider = function(self)
            return ' ' .. self.icon
        end,
        hl = function(self)
            return { fg = utils.get_highlight(self.icon_hl).fg, bg = 'bg' }
        end,
    }

    local split_filename = function(filename)
        if filename == '' then
            return { left = ' ', right = '[No Name]' }
        end
        local index = filename:find('/[^/]*$')
        if index == nil then
            index = 0
        end
        return {
            left = ' ' .. filename:sub(1, index),
            right = filename:sub(index + 1),
        }
    end

    local file_name_inner = {
        {
            provider = function(self)
                return self.split.left
            end,
            hl = { fg = 'fg_secondary', bg = 'bg' },
        },
        {
            provider = function(self)
                return self.split.right
            end,
            hl = { fg = 'fg', bg = 'bg' },
        },
    }

    local file_name = {
        init = function(self)
            self.lfilename = vim.fn.fnamemodify(self.filename, ':.')
        end,
        flexible = 2,
        {
            init = function(self)
                self.split = split_filename(self.lfilename)
            end,
            unpack(file_name_inner),
        },
        {
            init = function(self)
                self.split = split_filename(vim.fn.pathshorten(self.lfilename))
            end,
            unpack(file_name_inner),
        },
    }

    local file_flags = {
        hl = { fg = 'fg', bg = 'bg' },
        {
            condition = function()
                return vim.bo.modified
            end,
            provider = ' ' .. SYMBOLS.changed,
        },
        {
            condition = function()
                return not vim.bo.modifiable or vim.bo.readonly
            end,
            provider = ' ' .. SYMBOLS.readonly,
        },
    }

    local file_name_block = {
        init = function(self)
            self.filename = vim.api.nvim_buf_get_name(0)
        end,
        condition = is_file,
        file_icon,
        file_name,
        file_flags,
    }

    local file_encoding = {
        condition = function()
            local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
            return enc ~= 'utf-8'
        end,
        hl = { fg = 'fg', bg = 'bg' },
        provider = function()
            return ' ' .. ((vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc) .. ' '
        end,
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
        condition = function()
            return vim.b.minidiff_summary ~= nil
        end,
        -- update = { 'User', pattern = 'MiniDiffUpdated' },
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
        condition = not_file_tree,
        hl = { fg = 'fg', bg = 'bg' },
    }

    local ruler = {
        provider = ' %P ',
        condition = not_file_tree,
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
        hl = { bold = true, bg = 'bg' },
        {
            provider = function(self)
                return self.errors > 0 and (SYMBOLS.error .. self.errors .. ' ')
            end,
            hl = { fg = 'error', bold = true },
        },
        {
            provider = function(self)
                return self.warnings > 0 and (SYMBOLS.warn .. self.warnings .. ' ')
            end,
            hl = { fg = 'warn', bold = true },
        },
        {
            provider = function(self)
                return self.info > 0 and (SYMBOLS.info .. self.info .. ' ')
            end,
            hl = { fg = 'info', bold = true },
        },
        {
            provider = function(self)
                return self.hints > 0 and (SYMBOLS.hint .. self.hints .. ' ')
            end,
            hl = { fg = 'hint', bold = true },
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
            provider = function(self)
                return ' ' .. self.tabnr .. ' '
            end,
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
        condition = function()
            return #vim.api.nvim_list_tabpages() >= 2
        end,
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
            lsp_active,
            git_branch,
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
        callback = function()
            utils.on_colorscheme(setup_colors)
        end,
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
