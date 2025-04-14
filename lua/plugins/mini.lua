return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        local ai = require('mini.ai')
        ai.setup({
            custom_textobjects = {
                b = false,
                q = false,
                ['$'] = ai.gen_spec.pair('$', '$', { type = 'greedy' }),
            },
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
                suffix_last = '',
                suffix_next = '',
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
            indent = { suffix = '', options = {} },
            jump = { suffix = '', options = {} },
            location = { suffix = '', options = {} },
            oldfile = { suffix = '', options = {} },
            quickfix = { suffix = '', options = {} },
            treesitter = { suffix = '', options = {} },
            undo = { suffix = '', options = {} },
            window = { suffix = '', options = {} },
            yank = { suffix = '', options = {} },
        })
    end,
}
