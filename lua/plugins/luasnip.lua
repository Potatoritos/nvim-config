local greek_letters = {
    { name = 'alpha', has_capital = false },
    { name = 'beta', has_capital = false },
    { name = 'gamma', has_capital = true },
    { name = 'delta', has_capital = true },
    { name = 'epsilon', has_capital = false },
    { name = 'zeta', has_capital = false },
    { name = 'eta', has_capital = false },
    { name = 'theta', has_capital = true },
    { name = 'iota', has_capital = false },
    { name = 'kappa', has_capital = false },
    { name = 'lambda', has_capital = false },
    { name = 'mu', has_capital = false },
    { name = 'nu', has_capital = false },
    { name = 'xi', has_capital = true },
    { name = 'pi', has_capital = true },
    { name = 'rho', has_capital = false },
    { name = 'sigma', has_capital = true },
    { name = 'tau', has_capital = false },
    { name = 'upsilon', has_capital = false },
    { name = 'phi', has_capital = true },
    { name = 'chi', has_capital = false },
    { name = 'psi', has_capital = false },
    { name = 'omega', has_capital = true },
}

local capitalize = function(str)
    return str:gsub('^%l', string.upper)
end

local function load_snippets()
    require('luasnip.loaders.from_lua').lazy_load({
        paths = { '~/.config/nvim/snippets' },
    })
    -- require('luasnip.loaders.from_vscode').lazy_load({ paths = './snippets' })
end

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
            '<leader>Lr',
            load_snippets,
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
                sfmta = function(name, text, nodes)
                    return s(name, fmt(text, nodes, { indent_string = '    ', delimeters = '<>' }))
                end,
                greek_letters = greek_letters,
                capitalize = capitalize,
            },
            enable_autosnippets = true,
        })

        load_snippets()

        ls.filetype_extend('markdown', { 'tex' })

        local langs = { 'javascript', 'jsx', 'svelte', 'tsx', 'typescript', 'vue', 'xml' }
        for _, lang in ipairs(langs) do
            ls.filetype_extend(lang, { 'html' })
        end
    end,
}
