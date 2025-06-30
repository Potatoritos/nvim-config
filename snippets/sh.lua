---@diagnostic disable: undefined-global

return {
    sfmt(
        'while',
        [[
        while {} ; do
            {}
        done
        ]],
        { i(1), i(0) }
    ),
    sfmt(
        'if',
        [[
        if {} ; then
            {}
        fi
        ]],
        { i(1), i(0) }
    ),
    sfmt(
        'case',
        [[
        case {} in
            {}
        esac
        ]],
        { i(1), i(0) }
    ),
    sfmt(
        'for',
        [[
        for {} ; do
            {}
        done
        ]],
        { i(1), i(0) }
    ),
}
