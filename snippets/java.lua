---@diagnostic disable: undefined-global

return {
    s('pub', t('public ')),
    s('pri', t('private ')),
    s('pro', t('protected ')),
    s('pubf', t('public final ')),
    s('prif', t('private final ')),
    s('prof', t('protected final ')),
    s('pubs', t('public static ')),
    s('pris', t('private static ')),
    s('pros', t('protected static ')),
    s('pubsf', t('public static final ')),
    s('prisf', t('private static final ')),
    s('prosf', t('protected static final ')),
    s('of', { t('Optional.of('), i(1), t(')') }),
    s('ofn', { t('Optional.ofNullable('), i(1), t(')') }),
    s('emp', { t('Optional.empty()') }),
    sfmt(
        'if',
        [[
        if ({}) {{
            {}
        }}{}
        ]],
        { i(1), i(2), i(0) }
    ),
    sfmt(
        'elif',
        [[
         else if ({}) {{
            {}
        }}{}
        ]],
        { i(1), i(2), i(0) }
    ),
    sfmt(
        'else',
        [[
         else {{
            {}
        }}
        ]],
        { i(0) }
    ),
    sfmt(
        'cla',
        [[
        public class {} {{
            {}
            public {}({}) {{
                {}
            }}
        }}
        ]],
        {
            f(function() return vim.fn.expand('%:t:r') end),
            i(1),
            f(function() return vim.fn.expand('%:t:r') end),
            i(2),
            i(0),
        }
    ),
    s('log', t('FunnyCombat.LOGGER.')),
}
