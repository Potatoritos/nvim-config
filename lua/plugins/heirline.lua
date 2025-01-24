local config = function()
    local conditions = require('heirline.conditions')
    local utils = require('heirline.utils')
    local vi_mode = {
        init = function(self)
            self.mode = vim.fn.mode(1)
        end,
        static = {
            mode_names = {
                n = 'NORMAL',
                no = 'NORMAL',
                nov = 'NORMAL',
                noV = 'NORMAL',
                ['no\22'] = 'NORMAL',
                niI = 'NORMAL',
                niR = 'NORMAL',
                niV = 'NORMAL',
                nt = 'NORMAL',
                v = 'VISUAL',
                vs = 'VISUAL',
                V = 'VLINES',
                Vs = 'VISUAL',
                ['\22'] = 'VBLOCK',
                ['\22s'] = 'VBLOCK',
                s = 'SELECT',
                S = 'SLINES',
                ['\19'] = 'SBLOCK',
                i = 'INSERT',
                ic = 'INSERT',
                ix = 'INSERT',
                R = 'REPLACE',
                Rc = 'REPLACE',
                Rx = 'REPLACE',
                Rv = 'REPLACE',
                Rvc = 'REPLACE',
                Rvx = 'REPLACE',
                c = 'COMMAND',
                cv = 'EX',
                r = '...',
                rm = '---',
                ['r?'] = '?',
                ['!'] = '!',
                t = 'TERMINAL',
            },
            mode_colors = {
                n = COLORS.pink,
                i = COLORS.blue,
                v = COLORS.darkpink,
                V = COLORS.darkpink,
                ['\22'] = COLORS.darkpink,
                c = COLORS.purple,
                s = COLORS.cyan,
                S = COLORS.cyan,
                ['\19'] = COLORS.cyan,
                R = COLORS.blue2,
                r = COLORS.blue2,
                ['!'] = COLORS.green,
                t = COLORS.purple,
            },
        },
        provider = function(self)
            return ' ' .. self.mode_names[self.mode] .. ' '
        end,
        hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = COLORS.bg, bg = self.mode_colors[mode], bold = true }
        end,
        update = {
            'ModeChanged',
            pattern = '*:*',
            callback = vim.schedule_wrap(function()
                vim.cmd('redrawstatus')
            end),
        },
    }

    local align = { provider = '%=' }

    local file_name_block = {
        init = function(self)
            self.filename = vim.api.nvim_buf_get_name(0)
        end,
    }

    local file_icon = {
        init = function(self)
            local filename = self.filename
            local extension = vim.fn.fnamemodify(filename, ':e')
            self.icon, self.icon_color =
                require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
        end,
        provider = function(self)
            return self.icon and (self.icon .. ' ')
        end,
        hl = function(self)
            return { fg = self.icon_color }
        end,
    }

    local file_name = {
        init = function(self)
            self.lfilename = vim.fn.fnamemodify(self.filename, ':.')
            if self.lfilename == '' then
                self.lfilename = '[No Name]'
            end
        end,
        flexible = 2,
        {
            provider = function(self)
                return self.lfilename
            end,
        },
        {
            provider = function(self)
                return vim.fn.pathshorten(self.lfilename)
            end,
        },
        hl = { fg = COLORS.fg },
    }

    local file_flags = {
        {
            condition = function()
                return vim.bo.modified
            end,
            provider = ' ●',
            hl = { fg = COLORS.darkfg },
        },
        {
            condition = function()
                return not vim.bo.modifiable or vim.bo.readonly
            end,
            provider = '',
            hl = { fg = COLORS.darkfg },
        },
    }

    local file_encoding = {
        condition = function()
            local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
            return enc ~= 'utf-8'
        end,
        hl = { fg = COLORS.darkfg },
        provider = function()
            return ' ' .. ((vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc) .. ' '
        end,
    }

    local git_branch = {
        condition = conditions.is_git_repo,

        init = function(self)
            self.status_dict = vim.b.gitsigns_status_dict
        end,

        hl = { fg = COLORS.darkfg, bold = false },

        {
            provider = function(self)
                return '  ' .. self.status_dict.head .. ' '
            end,
        },
    }

    local git_changes = {
        condition = conditions.is_git_repo,
        init = function(self)
            self.status_dict = vim.b.gitsigns_status_dict
        end,
        hl = { bold = true },
        {
            provider = function(self)
                local count = self.status_dict.added or 0
                return count > 0 and ('+' .. count .. ' ')
            end,
            hl = { fg = COLORS.cyan },
        },
        {
            provider = function(self)
                local count = self.status_dict.removed or 0
                return count > 0 and ('-' .. count .. ' ')
            end,
            hl = { fg = COLORS.darkfg },
        },
        {
            provider = function(self)
                local count = self.status_dict.changed or 0
                return count > 0 and ('~' .. count .. ' ')
            end,
            hl = { fg = COLORS.pink },
        },
    }

    local position = {
        provider = '%l:%c',
        hl = { fg = COLORS.darkfg },
    }

    local ruler = {
        provider = '%P',
        hl = { fg = COLORS.darkpink, bold = true },
    }

    local diagnostics = {
        condition = conditions.has_diagnostics,

        static = {
            error_icon = ' ',
            warn_icon = ' ',
            info_icon = 'i ',
            hint_icon = '󰌵 ',
        },

        init = function(self)
            self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
            self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
            self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
            self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        end,

        update = { 'DiagnosticChanged', 'BufEnter' },

        {
            provider = function(self)
                return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
            end,
            hl = { fg = COLORS.darkpink, bold = true },
        },
        {
            provider = function(self)
                return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
            end,
            hl = { fg = COLORS.purple, bold = true },
        },
        {
            provider = function(self)
                return self.info > 0 and (self.info_icon .. self.info .. ' ')
            end,
            hl = { fg = COLORS.darkfg, bold = true },
        },
        {
            provider = function(self)
                return self.hints > 0 and (self.hint_icon .. self.hints .. ' ')
            end,
            hl = { fg = COLORS.darkfg, bold = true },
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
                    return '  ' .. table.concat(names, ' ') .. ' '
                end,
            },
        },
        {
            update = { 'LspAttach', 'LspDetach' },
            {
                provider = '  ',
            },
        },
        hl = { fg = COLORS.darkfg },
    }

    local tabpage = {
        init = function(self)
            local win = vim.api.nvim_tabpage_get_win(self.tabpage)
            local buf = vim.api.nvim_win_get_buf(win)
            self.filename = vim.api.nvim_buf_get_name(buf)
            if self.filename == '' then
                self.filename = '[No Name]'
            end

            local extension = vim.fn.fnamemodify(self.filename, ':e')
            self.icon, self.icon_color =
                require('nvim-web-devicons').get_icon_color(self.filename, extension, { default = true })
        end,
        {
            provider = '▎',
            hl = function(self)
                if self.is_active then
                    return { fg = COLORS.darkpink }
                else
                    return { fg = COLORS.lightbg }
                end
            end,
        },
        {
            provider = function(self)
                return ' ' .. self.tabnr .. ' '
            end,
            hl = function(self)
                if self.is_active then
                    return { fg = COLORS.darkpink, bold = true }
                else
                    return { fg = COLORS.darkfg, bold = true }
                end
            end,
        },
        {
            provider = function(self)
                return self.icon .. ' '
            end,
            hl = function(self)
                return { fg = self.icon_color }
            end,
        },
        {
            provider = function(self)
                return vim.fn.fnamemodify(self.filename, ':t') .. ' '
            end,
            hl = { fg = COLORS.darkfg, bold = false },
        },

        hl = function(self)
            if self.is_active then
                return { bg = COLORS.bg2 }
            else
                return { bg = COLORS.bg }
            end
        end,
    }

    local tabline = {
        condition = function()
            return #vim.api.nvim_list_tabpages() >= 2
        end,
        utils.make_tablist(tabpage),
    }

    local surround = function(component)
        return utils.surround({ ' ', ' ' }, nil, component)
    end
    local file_info = utils.insert(file_name_block, file_icon, file_name, file_flags)

    require('heirline').setup({
        statusline = {
            vi_mode,
            surround(file_info),
            git_changes,
            align,
            diagnostics,
            lsp_active,
            git_branch,
            file_encoding,
            surround(position),
            surround(ruler),
        },
        tabline = tabline,
    })
end

return {
    'rebelot/heirline.nvim',
    event = 'UiEnter',
    config = config,
}
