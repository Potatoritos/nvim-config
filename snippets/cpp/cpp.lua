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
    s('fi', t('first')),
    s('se', t('second')),
    sfmt('.pb', '.push_back({})', { i(1) }),
    sfmt('.pf', '.push_front({})', { i(1) }),
    postfix(
        { trig = '.all' },
        f(function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return match .. '.begin(), ' .. match .. '.end()'
        end)
    ),
}
