local kind_icons = {
    Class = ' 󰆧 ',
    Color = ' 󰏘 ',
    Constant = ' 󰏿 ',
    Constructor = ' 󰡱 ',
    Enum = '  ',
    EnumMember = '  ',
    Event = '  ',
    Field = ' 󰫧 ',
    File = '  ',
    Folder = ' 󰉋 ',
    Function = ' 󰊕 ',
    Interface = ' 󱐝 ',
    Keyword = ' 󰌋 ',
    Method = ' 󰊕 ', -- ' 󰡱 ',
    Module = ' 󰆦 ',
    Operator = ' 󰦒 ',
    Property = ' 󰜢 ',
    Reference = '  ', -- ' 󰪍 ',
    Snippet = ' 󰗀 ', -- ' 󰨾 ',
    Struct = ' 󰆧 ',
    Text = ' 󰦨 ',
    TypeParameter = ' 󰬛 ',
    Unit = '  ',
    Value = ' 󰎠 ',
    Variable = ' 󰫧 ',
}

-- 󱥌 󱥒 󱥔 󱥍 󱥏 󱥎 

return {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.*',
    opts = {
        keymap = {
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-l>'] = { 'snippet_forward', 'fallback' },
            ['<C-h>'] = { 'snippet_backward', 'fallback' },
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-e>'] = { 'hide', 'show', 'fallback' },
        },
        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer',
                'lazydev',
            },
        },
        completion = {
            list = {
                selection = 'preselect',
                cycle = {
                    from_bottom = true,
                    from_top = true,
                },
            },
            accept = {
                create_undo_point = true,
                auto_brackets = {
                    enabled = true,
                },
                menu = {
                    enabled = true,
                    max_height = 10,
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                update_delay_ms = 50,
                treesitter_highlighting = true,
            },
            ghost_text = {
                enabled = false,
            },
            menu = {
                draw = {
                    padding = { 0, 1 },
                    columns = {
                        { 'kind_icon' },
                        { 'label', 'label_description', gap = 1 },
                    },
                },
            },
        },
        fuzzy = {
            use_typo_resistance = false,
        },
        appearance = {
            kind_icons = kind_icons,
        },
    },
    opts_extend = { "sources.default" },
}

