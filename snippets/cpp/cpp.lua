---@diagnostic disable: undefined-global

return {
    sfmt(
        'ns',
        [[
        namespace {} {{

        {}

        }} // namespace {}
        ]],
        { i(1), i(2), extras.rep(1) }
    ),
    sfmt(
        'st',
        [[
        struct {} {{
            {}
        }};
        ]],
        { i(1), i(2) }
    ),
    s('nl', t("'\\n'")),
    s('ll', t('long long')),
    s('ld', t('long double')),
    s('us', t('unordered_set')),
    s('um', t('unordered_map')),
    postfix(
        { trig = '.all' },
        f(function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return match .. '.begin(), ' .. match .. '.end()'
        end)
    ),
}
