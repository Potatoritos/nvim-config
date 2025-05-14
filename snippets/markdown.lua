---@diagnostic disable: undefined-global

return {
    s('td', t('- [ ] ')),
    sfmt(
        'tm',
        [[
        # {}


        ]],
        {
            f(function(_, parent)
                local name = parent.snippet.env.TM_FILENAME:sub(1, -4)
                return name:gsub('_', ' '):gsub('^%l', string.upper)
            end),
        }
    ),
}
