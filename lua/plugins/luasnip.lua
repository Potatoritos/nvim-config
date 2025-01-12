return {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    event = {
        'InsertEnter',
        'VeryLazy',
    },
    keys = {
        {
            '<Tab>',
            function()
                local ls = require('luasnip')
                if ls.expandable() then
                    ls.expand()
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
                end
            end,
            mode = 'i',
        },
        {
            '<F11>',
            function()
                require('luasnip.loaders.from_lua').lazy_load({
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    paths = '~/.config/nvim/snippets',
                })
            end,
            mode = 'n',
            desc = 'Reload snippets',
        },
    },
    config = function()
        local ls = require('luasnip')
        local s = ls.snippet
        local fmt = require('luasnip.extras.fmt').fmt
        ls.setup({
            snip_env = {
                sfmt = function(name, text, nodes)
                    return s(name, fmt(text, nodes, { indent_string = '    ' }))
                end,
            },
            enable_autosnippets = true,
        })
        ls.filetype_extend('markdown', { 'tex' })

        -- require('luasnip.loaders.from_snipmate').lazy_load()
        require('luasnip.loaders.from_lua').lazy_load({
            ---@diagnostic disable-next-line: assign-type-mismatch
            paths = '~/.config/nvim/snippets',
        })
    end,
}
