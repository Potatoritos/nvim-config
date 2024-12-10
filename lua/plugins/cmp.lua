local kind_icons = {
    Class = '󰠱',
    Color = '󰏘',
    Constant = '󰏿',
    Constructor = '󰾍',
    Enum = '',
    EnumMember = '',
    Event = '',
    Field = '󰫧',
    File = '󰈙',
    Folder = '󰉋',
    Function = '󰊕',
    Interface = '',
    Keyword = '󰌋',
    Method = '󰡱',
    Module = '󰆧',
    Operator = '󰦒',
    Property = '󰜢',
    Reference = '󰪍',
    Snippet = '󰗀',
    Struct = '󰅩',
    Text = '󰦨',
    TypeParameter = '󰠲',
    Unit = '',
    Value = '󰎠',
    Variable = '󰫧',
}

local source_icons = {
    nvim_lsp = 'Lsp',
    buffer = 'Buf',
    path = 'Path',
    calc = 'Calc',
}

local opts = function()
    local cmp = require('cmp')
    return {
        mapping = {
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<Tab>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
            ['<C-u>'] = cmp.mapping.scroll_docs(-8),
            ['<C-d>'] = cmp.mapping.scroll_docs(8),
        },
        sources = {
            { name = 'path' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'nvim_lua' },
            { name = 'buffer' },
            { name = 'calc' },
            {
                name = 'lazydev',
                group_index = 0,
            },
        },
        view = {
            entries = {
                name = 'custom',
                selection_order = 'near_cursor',
            },
        },
        window = {
            completion = {
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
                side_padding = 0,
            },
        },
        formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            format = function(entry, item)
                item.menu = item.kind
                item.kind = string.format(' %s ', kind_icons[item.kind])
                return item
            end
        },
    }
end

return {
    {
        'hrsh7th/nvim-cmp',
        opts = opts,
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'hrsh7th/cmp-nvim-lsp-signature-help'
    },
    {
        'hrsh7th/cmp-path'
    },
    {
        'hrsh7th/cmp-buffer'
    },
    {
        'hrsh7th/cmp-calc'
    },
}
