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
    s('co', t('std::cout << ')),
    s('ci', t('std::cin >> ')),
    s('sv', t('std::vector')),
    s('sa', t('std::array')),
    s('sp', t('std::pair')),
    s('s', t('std::')),
    s('r', t('ranges::')),
    s('v', t('views::')),
    s('.fi', t('.first')),
    s('.se', t('.second')),
    sfmt('.pb', '.push_back({})', { i(1) }),
    sfmt('.pf', '.push_front({})', { i(1) }),
    sfmt('p', 'std::print("{}", {});', { i(1), i(2) }),
    sfmt('pl', 'std::println("{}", {});', { i(1), i(2) }),
    sfmt('mi', 'std::min({})', { i(1) }),
    sfmt('ma', 'std::max({})', { i(1) }),
    postfix(
        { trig = '.all' },
        f(function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return match .. '.begin(), ' .. match .. '.end()'
        end)
    ),
}
