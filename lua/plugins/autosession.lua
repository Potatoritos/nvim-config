return {
    'rmagatti/auto-session',
    lazy = false,
    ---@module 'auto-session'
    ---@type AutoSession.Config
    opts = {
        auto_restore = true,
        allowed_dirs = {
            '~/p/*',
            '~/p/*/*',
            '~/p/*/*/*',
            '~/s/*',
            '~/s/*/*',
            '~/.config/*',
            '~/notes',
            '~/notes/*',
            '~/cp',
            '~/cp/*',
        },
    },
}
