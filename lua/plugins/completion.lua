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
    Method = ' 󰊕 ',
    Module = ' 󰆦 ',
    Operator = ' 󰦒 ',
    Property = ' 󰜢 ',
    Reference = '  ',
    Snippet = ' 󰩫 ',
    Struct = ' 󰆧 ',
    Text = ' 󰦨 ',
    TypeParameter = ' 󰮄 ',
    Unit = '  ',
    Value = ' 󰎠 ',
    Variable = ' 󰫧 ',
}

return {
    'saghen/blink.cmp',
    version = 'v0.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-l>'] = { 'snippet_forward', 'fallback' },
            ['<C-h>'] = { 'snippet_backward', 'fallback' },
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
            ['<C-u>'] = {
                function(cmp)
                    return cmp.scroll_documentation_up(8)
                end,
            },
            ['<C-d>'] = {
                function(cmp)
                    return cmp.scroll_documentation_down(8)
                end,
            },
            ['<C-s>'] = { 'hide_documentation', 'show_documentation', 'fallback' },
            ['<C-space>'] = { 'hide', 'show', 'fallback' },
        },
        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer',
                'lazydev',
                -- 'markdown',
                'obsidian',
                'obsidian_new',
                'obsidian_tags',
            },
            transform_items = function(_, items)
                -- for _, item in ipairs(items) do
                --     if item.kind == require('blink.cmp.types').CompletionItemKind.Snippet then
                --         item.score_offset = item.score_offset - 3
                --     end
                -- end
                return items
            end,
            providers = {
                obsidian = {
                    name = 'obsidian',
                    module = 'blink.compat.source',
                },
                obsidian_new = {
                    name = 'obsidian_new',
                    module = 'blink.compat.source',
                    score_offset = -1,
                },
                obsidian_tags = {
                    name = 'obsidian_tags',
                    module = 'blink.compat.source',
                },
                -- markdown = {
                --     name = 'RenderMarkdown',
                --     module = 'render-markdown.integ.blink',
                -- },
                lsp = {
                    transform_items = function(_, items)
                        return vim.tbl_filter(function(item)
                            return item.kind ~= require('blink.cmp.types').CompletionItemKind.Snippet
                        end, items)
                    end,
                },
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    fallbacks = { 'lsp' },
                },
            },
        },
        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
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
            preset = 'luasnip',
        },
        signature = {
            enabled = true,
        },
    },
    dependencies = {
        {
            'saghen/blink.compat',
            version = false,
            opts = {
                impersonate_nvim_cmp = true,
            },
        },
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
        },
    },
}
