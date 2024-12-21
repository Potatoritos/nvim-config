---@diagnostic disable: undefined-global

return {
    s('then', {
        t({'then', '\t'}), i(0), t({'', 'end'})
    }),
    s('do', {
        t({'do', '\t'}), i(0), t({'', 'end'})
    }),
    s('fn', {
        t('function('), i(1), t({')', '\t'}), i(0), t({'', 'end'})
    }),
    s('fe', {
        t({'function()', '\t'}), i(0), t({'', 'end'})
    }),
}

