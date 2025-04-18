return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        local ai = require('mini.ai')
        ai.setup({
            custom_textobjects = {
                b = false,
                B = { '%b{}', '^.().*().$' },
                q = false,
                ['$'] = { { '%$%$().*()%$%$', '%$().*()%$' } },
                c = { '/%*().*()%*/' },
                C = {
                    {
                        '[^%a%d]()()[%l%d]*%f[^%l%d]()()',
                        '%u[%l%d]*%f[^%l%d]',
                    },
                },
                S = {
                    {
                        '()_+()[%a%d]+()()[^%a%d_]',
                        '[^%a%d]()()[%a%d]+()_+()',
                        '[^%a%d]()()[%a%d]+()()[^%a%d]',
                    },
                },
            },
            n_lines = 250,
        })

        require('mini.surround').setup({
            mappings = {
                add = '<Leader>u',
                delete = 'ds',
                find = '',
                find_left = '',
                highlight = '',
                replace = 'cs',
                update_n_lines = '',
                suffix_last = 'l',
                suffix_next = 'n',
            },
            custom_surroundings = {
                ['B'] = { output = { left = '{', right = '}' } },
                ['c'] = { output = { left = '/* ', right = ' */' } },
            },
        })

        require('mini.icons').setup({
            extension = {
                typ = { glyph = '' },
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
    end,
}
