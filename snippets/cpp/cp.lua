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
    s('pi', t('pair<int, int>')),
    s('pl', t('pair<ll, ll>')),
    s('vi', t('vector<int>')),
    s('vl', t('vector<ll>')),
    s('vpi', t('vector<pair<int, int>>')),
    s('vpl', t('vector<pair<ll, ll>>')),
}
