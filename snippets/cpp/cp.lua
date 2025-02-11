---@diagnostic disable: undefined-global

local s_for = function(trig, comparison)
    return postfix(
        {
            trig = trig,
            match_pattern = '%S+%s%S+%s%S+%s$',
        },
        d(1, function(_, parent)
            local line = parent.snippet.env.POSTFIX_MATCH
            local m = {}

            for match in line:gmatch('(%S+)%s') do
                table.insert(m, match)
            end
            return sn(nil, {
                t({
                    ('for (int %s = %s; %s %s %s; %s++) {'):format(m[1], m[2], m[1], comparison, m[3], m[1]),
                    '\t',
                }),
                i(1),
                t({ '', '}' }),
            })
        end)
    )
end

return {
    s_for('fe', '<='),
    s_for('fl', '<'),
    s_for('re', '>='),
    s_for('rl', '>'),
    s('pi', t('std::pair<int, int>')),
    s('pl', t('std::pair<ll, ll>')),
    s('vi', t('std::vector<int>')),
    s('vl', t('std::vector<ll>')),
    s('vpi', t('std::vector<std::pair<int, int>>')),
    s('vpl', t('std::vector<std::pair<ll, ll>>')),
    s('ht', t('hash_table')),
    s('hs', t('hash_set')),
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
