return     {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    event = {
        'InsertEnter',
        'VeryLazy',
    },
    config = function()
        local ls = require('luasnip')
        ls.config.set_config({
            enable_autosnippets = true,
        })
        ls.filetype_extend('markdown', { 'tex' })

        require('luasnip.loaders.from_snipmate').lazy_load()
        require('luasnip.loaders.from_lua').load({
            ---@diagnostic disable-next-line: assign-type-mismatch
            paths = '~/.config/nvim/snippets'
        })
    end,
}
