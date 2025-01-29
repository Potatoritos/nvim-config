return {
    'rmagatti/auto-session',
    lazy = false,
    ---@module 'auto-session'
    ---@type AutoSession.Config
    opts = {
        allowed_dirs = {
            '~/p/*',
            '~/p/*/*',
            '~/p/*/*/*',
            '~/s/*',
            '~/s/*/*',
            '~/.config/nvim',
            '~/notes',
            '~/cp',
            '~/cp/*',
        },
    },
}
