---@diagnostic disable: undefined-global

return {
    sfmt(
        'tm',
        [[
        #import "/template.typ": *
        #show: template

        = {}


        ]],
        {
            f(function(_, parent)
                local name = parent.snippet.env.TM_FILENAME:sub(1, -5)
                return name:gsub('_', ' '):gsub('^%l', string.upper)
            end),
        }
    ),
}
