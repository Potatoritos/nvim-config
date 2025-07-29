---@diagnostic disable: undefined-global

return {
    s('pf', t('public final ')),
    s('rf', t('private final ')),
    s('tf', t('protected final ')),
    s('ps', t('public static ')),
    s('rs', t('private static ')),
    s('ts', t('protected static ')),
    s('psf', t('public static final ')),
    s('rsf', t('private static final ')),
    s('tsf', t('protected static final ')),
    s('of', { t('Optional.of('), i(1), t(')') }),
    s('ofn', { t('Optional.ofNullable('), i(1), t(')') }),
    s('emp', { t('Optional.empty()') }),
    s('ov', { t({ '@Override', '' }) }),
    sfmt(
        'cla',
        [[
        public final class {} {{
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
