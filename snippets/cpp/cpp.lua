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
        'b',
        [[
        {{
            {}
        }};
        ]],
        { i(1) }
    ),
    s('nl', t("'\\n'")),
    s('ll', t('long long')),
    s('ld', t('long double')),
    s('sv', t('std::vector')),
    s('sa', t('std::array')),
    s('sp', t('std::pair')),
    s('s', t('std::')),
    s('r', t('ranges::')),
    s('v', t('views::')),
    postfix(
        { trig = '.all' },
        f(function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return match .. '.begin(), ' .. match .. '.end()'
        end)
    ),
}
