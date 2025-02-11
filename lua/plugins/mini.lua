return {
    'echasnovski/mini.ai',
    version = '*',
    config = function()
        local ai = require('mini.ai')
        ai.setup({
            custom_textobjects = {
                b = false,
                q = false,
                ['$'] = ai.gen_spec.pair('$', '$', { type = 'greedy' }),
            },
            mappings = {
                around_next = '',
                inside_next = '',
                around_last = '',
                inside_last = '',
            },
        })
    end,
}
