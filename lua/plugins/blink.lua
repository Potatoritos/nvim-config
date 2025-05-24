return {
    'saghen/blink.cmp',
    version = '*',
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
                'fallback',
            },
            ['<C-d>'] = {
                function(cmp)
                    return cmp.scroll_documentation_down(8)
                end,
                'fallback',
            },
            ['<C-n>'] = { 'hide_documentation', 'show_documentation', 'fallback' },
            ['<C-s>'] = { 'hide_signature', 'show_signature', 'fallback' },
            ['<C-space>'] = { 'hide', 'show', 'fallback' },
        },
        sources = {
            default = {
                'lsp',
                'path',
                'snippets',
                'buffer',
                'lazydev',
                'markdown',
            },
            transform_items = function(_, items)
                return items
            end,
            providers = {
                markdown = {
                    name = 'RenderMarkdown',
                    module = 'render-markdown.integ.blink',
                },
                snippets = {
                    score_offset = 1000,
                    max_items = 1,
                },
                lsp = {
                    transform_items = function(_, items)
                        local kind = require('blink.cmp.types').CompletionItemKind
                        for _, item in ipairs(items) do
                            if item.kind == kind.Keyword then
                                item.score_offset = item.score_offset - 2
                            end
                        end
                        return vim.tbl_filter(function(item)
                            return item.kind ~= kind.Snippet
                        end, items)
                    end,
                },
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    fallbacks = { 'lsp' },
                },
                buffer = {
                    -- min_keyword_length = 4,
                },
            },
            -- min_keyword_length = 3,
        },
        cmdline = {
            keymap = {
                preset = 'inherit',
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
                auto_show = false,
                auto_show_delay_ms = 1000,
                update_delay_ms = 50,
                treesitter_highlighting = true,
                window = {
                    border = 'rounded',
                },
            },
            ghost_text = {
                enabled = false,
            },
            menu = {
                border = 'rounded',

                draw = {
                    columns = {
                        { 'kind_icon' },
                        { 'label' },
                        { 'label_description' },
                    },
                },
            },
        },
        fuzzy = {
            max_typos = function(_)
                return 0
            end,
            use_frecency = false,
            sorts = {
                'exact',
                'score',
                'sort_text',
            },
        },
        appearance = {
            kind_icons = KIND_ICONS,
        },
        snippets = {
            preset = 'luasnip',
        },
        signature = {
            enabled = true,
            window = {
                border = 'rounded',
            },
        },
    },
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
        },
    },
}
