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
            completion = {
                enabled_providers = {
                    'lsp',
                    'path',
                    'luasnip',
                    -- 'snippets',
                    'buffer',
                    'lazydev',
                },
            },
            providers = {
                lsp = {
                    fallback_for = { "lazydev" }
                },
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink"
                },
                luasnip = {
                    name = 'luasnip',
                    module = 'blink.compat.source',
                    score_offset = 10,
                    -- score_offset = function()
                    --     if require('luasnip').expandable() then
                    --         return 100
                    --     end
                    --     return 0
                    -- end,
                    -- enabled = function(ctx)
                    --     return not (ctx ~= nil and ctx.trigger.kind == vim.lsp.protocol.CompletionTriggerKind.TriggerCharacter)
                    -- end,
                },
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
        snippets = {
            expand = function(snippet)
                require('luasnip').lsp_expand(snippet)
            end,
            active = function(filter)
                if filter and filter.direction then
                    return require('luasnip').jumpable(filter.direction)
                end
                return require('luasnip').in_snippet()
            end,
            jump = function(direction)
                require('luasnip').jump(direction)
            end,
        },
    },
    dependencies = {
        {
            'saghen/blink.compat',
            opts = {
                impersonate_nvim_cmp = true,
            },
        },
        {
            'saadparwaiz1/cmp_luasnip',
        },
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
        },
    },
}
