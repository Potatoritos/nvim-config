---@diagnostic disable: undefined-global

return {
    postfix(
        {
            trig = '>',
            snippetType = 'autosnippet',
            match_pattern = '%f[^<][%a_%-]+$',
        },
        d(1, function(_, parent)
            local match = parent.snippet.env.POSTFIX_MATCH
            return sn(nil, {
                t(match .. '>'),
                i(1),
                t('</' .. match .. '>'),
            })
        end)
    ),
}
