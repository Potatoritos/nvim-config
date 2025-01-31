COLORS = {
    bg = '#161616',
    bg1 = '#202020',
    bg2 = '#262626',
    bg3 = '#393939',
    lightbg = '#525252',
    darkfg = '#b2b4b8',
    darkfg2 = '#77707d',
    -- darkfg2 = '#7d707d',
    fg = '#dde1e6',
    fg2 = '#f2f4f8',
    fg3 = '#ffffff',
    darkcyan = '#08bdba',
    cyan = '#3ddbd9',
    blue2 = '#78a9ff',
    darkpink = '#ee5396',
    blue = '#33b1ff',
    pink = '#ff7eb6',
    green = '#42be65',
    purple = '#be95ff',
    lightblue = '#82cfff',
    black = '#131313',
    bg_darkpink = '#442431',
    bg_darkcyan = '#153332',
    bg_blue2 = '#232e44',
    lightbg_pink = '#7d3e59',
    lightbg_darkpink = '#752b49',
    lightbg_blue2 = '#3b537d',
    lightbg_blue = '#1e577d',
    lightbg_darkcyan = '#145c5b',
}

HIGHLIGHTS = {
    error = COLORS.darkpink,
    warn = COLORS.purple,
    hint = COLORS.darkfg,
    info = COLORS.darkfg,
    add = COLORS.cyan,
    change = COLORS.pink,
    delete = COLORS.darkfg,
    mode = {
        normal = COLORS.darkcyan,
        insert = COLORS.blue2,
        replace = COLORS.blue,
        command = COLORS.purple,
        visual = COLORS.darkpink,
        select = COLORS.cyan,
        terminal = COLORS.purple,
        other = COLORS.green,
    },
    border = COLORS.bg3,
    inverse_fg = '#000000',
}

SYMBOLS = {
    error = 'X', -- '',
    warn = '?', -- '',
    hint = '',
    info = 'i',
    changed = '●',
    readonly = '',
    lsp = '',
    branch = '',
}
