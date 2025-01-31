vim.cmd.colorscheme('oxocarbon')

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = SYMBOLS.error,
            [vim.diagnostic.severity.WARN] = SYMBOLS.warn,
            [vim.diagnostic.severity.INFO] = SYMBOLS.info,
            [vim.diagnostic.severity.HINT] = SYMBOLS.hint,
        },
        linehl = {},
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'LineNr',
            [vim.diagnostic.severity.WARN] = 'LineNr',
            [vim.diagnostic.severity.INFO] = 'LineNr',
            [vim.diagnostic.severity.HINT] = 'LineNr',
        },
    },
    severity_sort = true,
    underline = true,
})

vim.api.nvim_set_hl(0, 'YankHighlight', { bg = COLORS.lightbg_darkpink })
-- vim.api.nvim_set_hl(0, 'Visual', { bg = COLORS.lightbg_blue2 })

vim.api.nvim_set_hl(0, 'Comment', { fg = COLORS.darkfg2, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = COLORS.fg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Normal', { fg = COLORS.fg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = COLORS.darkfg, bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = COLORS.bg })

vim.api.nvim_set_hl(0, 'LineNr', { fg = COLORS.darkfg2, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'Search', { fg = COLORS.bg, bg = COLORS.cyan, bold = true })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = COLORS.bg, bg = COLORS.pink, bold = true })
vim.api.nvim_set_hl(0, 'CurSearch', { fg = COLORS.bg, bg = COLORS.pink, bold = true })

vim.api.nvim_set_hl(0, 'LazyNormal', { fg = COLORS.darkfg, bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'MasonNormal', { fg = COLORS.darkfg, bg = COLORS.bg })

vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = HIGHLIGHTS.change })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = HIGHLIGHTS.add })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = HIGHLIGHTS.delete })
vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = COLORS.darkfg2 })

vim.api.nvim_set_hl(0, 'GitSignsStagedAdd', { fg = HIGHLIGHTS.add })
vim.api.nvim_set_hl(0, 'GitSignsStagedChange', { fg = HIGHLIGHTS.change })
vim.api.nvim_set_hl(0, 'GitSignsStagedDelete', { fg = HIGHLIGHTS.delete })
vim.api.nvim_set_hl(0, 'GitSignsStagedChangedelete', { fg = HIGHLIGHTS.change })

vim.api.nvim_set_hl(0, 'DiffChange', { fg = HIGHLIGHTS.change })
vim.api.nvim_set_hl(0, 'DiffChanged', { fg = HIGHLIGHTS.change })
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = HIGHLIGHTS.add })
vim.api.nvim_set_hl(0, 'DiffAdded', { fg = HIGHLIGHTS.add })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = HIGHLIGHTS.delete })
vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = HIGHLIGHTS.delete })

vim.api.nvim_set_hl(0, 'Added', { fg = HIGHLIGHTS.add })
vim.api.nvim_set_hl(0, 'Changed', { fg = HIGHLIGHTS.change })
vim.api.nvim_set_hl(0, 'Removed', { fg = HIGHLIGHTS.delete })

vim.api.nvim_set_hl(0, 'PmenuSel', { fg = 'NONE', bg = COLORS.bg3 })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = 'NONE', bg = COLORS.bg2 })

vim.api.nvim_set_hl(0, 'Special', { fg = COLORS.pink })

vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = 'NONE', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = HIGHLIGHTS.hint, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = HIGHLIGHTS.info, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = HIGHLIGHTS.warn, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = HIGHLIGHTS.error, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { sp = HIGHLIGHTS.hint, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { sp = HIGHLIGHTS.info, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { sp = HIGHLIGHTS.warn, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = HIGHLIGHTS.error, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = HIGHLIGHTS.hint, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = HIGHLIGHTS.info, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = HIGHLIGHTS.warn, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = HIGHLIGHTS.error, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'SnippetTabStop', { bg = COLORS.bg2 })

vim.api.nvim_set_hl(0, 'TroubleNormal', { fg = COLORS.darkfg, bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'TroubleNormalNC', { fg = COLORS.darkfg, bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'TroubleText', { fg = COLORS.darkfg, bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'TroubleDiagnosticsCount', { fg = COLORS.darkfg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TroubleFsCount', { fg = COLORS.darkfg, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'BlinkCmpLabel', { fg = COLORS.darkfg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDescription', { fg = COLORS.darkfg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDetail', { fg = COLORS.darkfg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDeprecated', { fg = COLORS.darkfg, bg = 'NONE', strikethrough = true })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelMatch', { fg = COLORS.pink, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { fg = 'NONE', bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { fg = HIGHLIGHTS.border, bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { fg = 'NONE', bg = COLORS.bg2 })
vim.api.nvim_set_hl(0, 'BlinkCmpDocSeparator', { fg = COLORS.bg2 })
vim.api.nvim_set_hl(0, 'BlinkCmpDoc', { fg = COLORS.darkfg, bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', { fg = HIGHLIGHTS.border, bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelp', { fg = COLORS.darkfg, bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { fg = HIGHLIGHTS.border, bg = COLORS.bg })

vim.api.nvim_set_hl(0, 'BlinkCmpKindClass', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindColor', { fg = COLORS.darkpink, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindConstant', { fg = COLORS.purple, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindConstructor', { fg = COLORS.pink, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindEnum', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindEnumMember', { fg = COLORS.purple, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindEvent', { fg = COLORS.green, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindField', { fg = COLORS.purple, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindFile', { fg = COLORS.lightblue, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindFolder', { fg = COLORS.lightblue, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindFunction', { fg = COLORS.pink, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindInterface', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindKeyword', { fg = COLORS.darkcyan, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindMethod', { fg = COLORS.pink, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindModule', { fg = COLORS.darkcyan, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindOperator', { fg = COLORS.pink, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindProperty', { fg = COLORS.darkpink, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindReference', { fg = COLORS.purple, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindSnippet', { fg = COLORS.blue, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindStruct', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindText', { fg = COLORS.darkfg, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindTypeParameter', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindUnit', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindValue', { fg = COLORS.purple, bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpKindVariable', { fg = COLORS.purple, bold = true })

vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = 'NONE', bg = COLORS.bg3 })

vim.api.nvim_set_hl(0, 'FzfLuaBorder', { fg = COLORS.bg3 })
vim.api.nvim_set_hl(0, 'FzfLuaTitle', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, 'FzfLuaHeaderBind', { fg = COLORS.purple })
vim.api.nvim_set_hl(0, 'FzfLuaHeaderText', { fg = COLORS.darkfg })
vim.api.nvim_set_hl(0, 'FzfLuaPathColNr', { fg = COLORS.lightblue })
vim.api.nvim_set_hl(0, 'FzfLuaPathLineNr', { fg = COLORS.blue })
vim.api.nvim_set_hl(0, 'FzfLuaBufNr', { fg = COLORS.lightblue })
vim.api.nvim_set_hl(0, 'FzfLuaBufLineNr', { fg = COLORS.lightblue })

vim.api.nvim_set_hl(0, 'FzfLuaBufFlagCur', { fg = COLORS.purple })
vim.api.nvim_set_hl(0, 'FzfLuaBufFlagAlt', { fg = COLORS.blue })
vim.api.nvim_set_hl(0, 'FzfLuaTabTitle', { fg = COLORS.lightblue })
vim.api.nvim_set_hl(0, 'FzfLuaTabMarker', { fg = COLORS.darkfg })
vim.api.nvim_set_hl(0, 'FzfLuaLiveSym', { fg = COLORS.darkfg })

vim.api.nvim_set_hl(0, 'FzfLuaSearch', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, 'FzfLuaFzfCursorLine', { bold = false })
vim.api.nvim_set_hl(0, 'FzfLuaFzfMatch', { fg = COLORS.pink, bold = true })
vim.api.nvim_set_hl(0, 'FzfLuaFzfPrompt', { fg = COLORS.pink, bold = true })

vim.api.nvim_set_hl(0, 'RenderMarkdownSuccess', { fg = COLORS.green, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'RenderMarkdownInfo', { fg = COLORS.blue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'RenderMarkdownWarn', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'RenderMarkdownError', { fg = COLORS.pink, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'RenderMarkdownQuote', { fg = COLORS.darkfg })

vim.api.nvim_set_hl(0, 'RenderMarkdownBullet', { fg = COLORS.lightbg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'RenderMarkdownInlineHighlight', { fg = COLORS.blue, bg = COLORS.bg_blue2 })
vim.api.nvim_set_hl(0, 'RenderMarkdownDash', { fg = COLORS.bg3, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'RenderMarkdownCodeInline', { fg = COLORS.pink, bg = COLORS.bg2 })
vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { fg = 'NONE', bg = COLORS.bg1 })

vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { fg = COLORS.pink, bg = COLORS.bg_darkpink, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = COLORS.darkcyan, bg = COLORS.bg_darkcyan, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { fg = COLORS.blue2, bg = COLORS.bg_blue2, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { fg = COLORS.blue2, bg = COLORS.bg_blue2, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { fg = COLORS.blue2, bg = COLORS.bg_blue2, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { fg = COLORS.blue2, bg = COLORS.bg_blue2, bold = true })
vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = COLORS.bg_darkpink })
vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = COLORS.bg_darkcyan })
vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = COLORS.bg_blue2 })
vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = COLORS.bg_blue2 })
vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = COLORS.bg_blue2 })
vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = COLORS.bg_blue2 })

vim.api.nvim_set_hl(0, 'RenderMarkdownTableHead', { fg = COLORS.lightbg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'RenderMarkdownTableRow', { fg = COLORS.lightbg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'RenderMarkdownTableFill', { fg = COLORS.lightbg, bg = 'NONE' })

vim.api.nvim_set_hl(0, '@markup.raw.markdown_inline', { fg = COLORS.pink, bg = COLORS.bg2 })
vim.api.nvim_set_hl(0, '@markup.list.markdown', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, '@markup.link.label.markdown_inline', { fg = COLORS.pink, underline = true })
vim.api.nvim_set_hl(0, '@markup.list.checked', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, '@markup.list.unchecked', { fg = COLORS.darkfg })
vim.api.nvim_set_hl(0, '@markup.quote.markdown', { fg = COLORS.darkfg })

vim.api.nvim_set_hl(0, 'ObsidianTag', { fg = COLORS.pink, bg = COLORS.bg_darkpink })

vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = COLORS.darkfg2, bg = 'NONE' })
vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = COLORS.darkfg2, bg = 'NONE' })
vim.api.nvim_set_hl(0, '@constructor.lua', { fg = COLORS.darkfg2, bg = 'NONE' })
vim.api.nvim_set_hl(0, '@constructor', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Number', { fg = COLORS.blue2, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = COLORS.bg })
vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { sp = COLORS.darkfg2, underline = true })

vim.g.terminal_color_0 = COLORS.bg
vim.g.terminal_color_1 = COLORS.pink
vim.g.terminal_color_2 = COLORS.green
vim.g.terminal_color_3 = COLORS.blue
vim.g.terminal_color_4 = COLORS.blue2
vim.g.terminal_color_5 = COLORS.purple
vim.g.terminal_color_6 = COLORS.cyan
vim.g.terminal_color_7 = COLORS.darkfg
vim.g.terminal_color_8 = COLORS.darkfg2
vim.g.terminal_color_9 = COLORS.darkpink
vim.g.terminal_color_10 = COLORS.green
vim.g.terminal_color_11 = COLORS.blue
vim.g.terminal_color_12 = COLORS.blue2
vim.g.terminal_color_13 = COLORS.purple
vim.g.terminal_color_14 = COLORS.darkcyan
vim.g.terminal_color_15 = COLORS.darkfg
