---@diagnostic disable: undefined-global

return {
    sfmt(
        'fe',
        [[
        for (auto &{} : {}) {{
            {}
        }}
        ]],
        { i(1), i(2), i(3) }
    ),
    sfmt(
        'lt',
        [[
        auto {} = [&](this auto {}, {}) -> {} {{
            {}
        }};
        ]],
        {
            i(1),
            extras.rep(1),
            i(2),
            i(3, 'void'),
            i(4),
        }
    ),
    s('spi', t('std::pair<int, int>')),
    s('spl', t('std::pair<ll, ll>')),
    s('svi', t('std::vector<int>')),
    s('svl', t('std::vector<ll>')),
    sfmt('sai', 'std::array<int, {}>', { i(1) }),
    sfmt('sal', 'std::array<ll, {}>', { i(1) }),
    s('svpi', t('std::vector<std::pair<int, int>>')),
    s('svpl', t('std::vector<std::pair<ll, ll>>')),
    sfmt('p', 'std::print("{}", {});', { i(1), i(2) }),
    sfmt('pl', 'std::println("{}", {});', { i(1), i(2) }),
    postfix(
        { trig = '.l' },
        f(function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return 'len(' .. match .. ')'
        end)
    ),
    postfix(
        { trig = '.c' },
        d(1, function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return sn(nil, {
                t(match .. '.find('),
                i(1),
                t(') != ' .. match .. '.end()'),
            })
        end)
    ),
    postfix(
        { trig = '.nc' },
        d(1, function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return sn(nil, {
                t(match .. '.find('),
                i(1),
                t(') == ' .. match .. '.end()'),
            })
        end)
    ),
}
