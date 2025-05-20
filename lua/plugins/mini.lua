return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        local ai = require('mini.ai')
        ai.setup({
            custom_textobjects = {
                ['b'] = false,
                ['B'] = { '%b{}', '^.().*().$' },
                ['q'] = false,
                ['f'] = ai.gen_spec.function_call({ name_pattern = '[%w_]' }),
                ['F'] = ai.gen_spec.function_call(),
                ['$'] = { '%b$$', '^.().*().$' },
                ['E'] = { '%$%$\n?().-()\n?%$%$' },
                ['c'] = { '/%*().-()%*/' },
                ['e'] = { '%*%*().-()%*%*' },
                ['r'] = { '%[%[().-()%]%]' },
                ['h'] = { '==().-()==' },
                ['L'] = { '```%a*\n?().-()\n?```' },
                ['D'] = { '"""\n?().-()\n?"""' },
            },
            n_lines = 250,
        })

        require('mini.surround').setup({
            mappings = {
                add = 'gs',
                delete = 'ds',
                find = '',
                find_left = '',
                highlight = '',
                replace = 'cs',
                update_n_lines = '',
                suffix_last = 'l',
                suffix_next = 'n',
            },
            n_lines = 50,
            custom_surroundings = {
                ['B'] = {
                    input = { '{().-()}' },
                    output = { left = '{', right = '}' },
                },
                ['c'] = {
                    input = { '/%*%s?().-()%s?%*/' },
                    output = { left = '/* ', right = ' */' },
                },
                ['e'] = {
                    input = { '%*%*().-()%*%*' },
                    output = { left = '**', right = '**' },
                },
                ['r'] = {
                    input = { '%[%[().-()%]%]' },
                    output = { left = '[[', right = ']]' },
                },
                ['h'] = {
                    input = { '==().-()==' },
                    output = { left = '==', right = '==' },
                },
                ['E'] = {
                    input = { '%$%$\n?().-()\n?%$%$' },
                    output = { left = '$$\n', right = '\n$$' },
                },
                ['L'] = {
                    input = { '```%a*\n?().-()\n?```' },
                    output = { left = '```\n', right = '\n```' },
                },
                ['C'] = {
                    input = { '```%a*\n?().-()\n?```' },
                    output = function()
                        local lang = vim.fn.input('Language: ')
                        return { left = '```' .. lang .. '\n', right = '\n```' }
                    end,
                },
                ['D'] = {
                    input = { '"""().-()"""' },
                    output = { left = '"""', right = '"""' },
                },
            },
        })

        vim.keymap.set('n', 'gss', function()
            return 'gs_'
        end, { expr = true, remap = true })
        vim.keymap.set('n', 'gS', function()
            return 'gs$'
        end, { expr = true, remap = true })

        require('mini.icons').setup({
            default = {},
            extension = {
                typ = { glyph = '' },
                cpp = { glyph = '' },
                c = { glyph = '' },
            },
            file = {
                ['README.md'] = { glyph = '󰈈' },
                ['README.txt'] = { glyph = '󰈈' },
            },
        })

        require('mini.bracketed').setup({
            buffer = { suffix = '', options = {} },
            comment = { suffix = 'c', options = { add_to_jumplist = true } },
            conflict = { suffix = '', options = {} },
            diagnostic = { suffix = '', options = {} },
            file = { suffix = '', options = {} },
            indent = { suffix = 'i', options = { add_to_jumplist = true } },
            jump = { suffix = '', options = {} },
            location = { suffix = '', options = {} },
            oldfile = { suffix = '', options = {} },
            quickfix = { suffix = '', options = {} },
            treesitter = { suffix = '', options = {} },
            undo = { suffix = '', options = {} },
            window = { suffix = '', options = {} },
            yank = { suffix = '', options = {} },
        })

        require('mini.indentscope').setup({
            draw = {
                predicate = function()
                    return false
                end,
            },
            options = {
                indent_at_cursor = false,
            },
        })

        require('mini.diff').setup({
            view = {
                style = 'sign',
                signs = {
                    add = '┃',
                    change = '┃',
                    delete = '┃',
                },
            },
            mappings = {
                apply = '',
                reset = '',
                textobject = 'ih',
            },
        })

        vim.keymap.set('n', '<Leader>gh', function()
            MiniDiff.toggle_overlay(0)
        end, { desc = 'Toggle hunk overlay' })

        require('mini.git').setup()

        vim.keymap.set('n', '<Leader>gi', function()
            MiniGit.show_at_cursor()
        end, { desc = 'Show git data at cursor' })

        local clue = require('mini.clue')
        clue.setup({
            triggers = {
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },

                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },

                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },

                { mode = 'n', keys = '<C-w>' },

                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },

            clues = {
                clue.gen_clues.builtin_completion(),
                clue.gen_clues.g(),
                clue.gen_clues.marks(),
                clue.gen_clues.registers(),
                clue.gen_clues.windows(),
                clue.gen_clues.z(),
            },
            window = {
                config = {
                    width = 32,
                    height = 16,
                },
            },
        })
    end,
}
