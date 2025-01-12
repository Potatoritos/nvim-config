---@diagnostic disable: undefined-global

return {
    sfmt(
        'then',
        [[
        then
            {}
        end
        ]],
        { i(0) }
    ),
    sfmt(
        'do',
        [[
        do
            {}
        end
        ]],
        { i(0) }
    ),
    sfmt(
        'fn',
        [[
        function({})
            {}
        end
        ]],
        { i(1), i(0) }
    ),
    sfmt(
        'fe',
        [[
        function()
            {}
        end
        ]],
        { i(0) }
    ),
    sfmt(
        'sf',
        [=[
        sfmt(
            '{}',
            [[
            {}
            ]],
            {{ {} }}
        ),
        ]=],
        { i(1), i(2), i(3) }
    ),
}
