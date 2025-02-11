---@diagnostic disable: undefined-global

local apply_all = function(name)
    return postfix(
        { trig = '.' .. name },
        d(1, function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return sn(nil, {
                t(('std::%s(%s.begin(), %s.end(), '):format(name, match, match)),
                i(1),
                t(');'),
            })
        end)
    )
end

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
    s('co', t('std::cout << ')),
    s('ci', t('std::cin >> ')),
    s('v', t('std::vector')),
    s('a', t('std::array')),
    s('p', t('std::pair')),
    s('st', t('std::string')),
    s('s', t('std::')),
    s('.fi', t('.first')),
    s('.se', t('.second')),
    sfmt('.pb', '.push_back({})', { i(1) }),
    sfmt('.pf', '.push_front({})', { i(1) }),
    sfmt('.eb', '.emplace_back({})', { i(1) }),
    sfmt('.ef', '.emplace_front({})', { i(1) }),
    sfmt('mi', 'std::min({})', { i(1) }),
    sfmt('ma', 'std::max({})', { i(1) }),
    postfix(
        { trig = '.all' },
        f(function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return match .. '.begin(), ' .. match .. '.end()'
        end)
    ),
    apply_all('fill'),
    apply_all('iota'),
}
