---@diagnostic disable: undefined-global

return {
    s('pu', t('public ')),
    s('pi', t('private ')),
    s('po', t('protected ')),
    s('puf', t('public final ')),
    s('pif', t('private final ')),
    s('pof', t('protected final ')),
    s('pus', t('public static ')),
    s('pis', t('private static ')),
    s('pos', t('protected static ')),
    s('pusf', t('public static final ')),
    s('pisf', t('private static final ')),
    s('posf', t('protected static final ')),
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
        'fr',
        [[
        for ({}) {{
            {}
        }}
        ]],
        { i(1), i(0) }
    ),
    sfmt(
        'wl',
        [[
        while ({}) {{
            {}
        }}
        ]],
        { i(1), i(0) }
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
