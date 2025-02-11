vim.cmd.colorscheme('oxocarbon')

local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

hl('YankHighlight', { bg = COLORS.lightbg_darkpink })
-- hl('Visual', { bg = COLORS.lightbg_blue2 })

hl('Comment', { fg = COLORS.darkfg2, bg = 'NONE' })
hl('NormalNC', { fg = COLORS.darkfg, bg = 'NONE' })
hl('Normal', { fg = COLORS.darkfg, bg = 'NONE' })
hl('NormalFloat', { fg = COLORS.darkfg, bg = COLORS.bg })
hl('StatusLineNC', { bg = COLORS.bg })

hl('LineNr', { fg = COLORS.darkfg2, bg = 'NONE' })

hl('Search', { fg = COLORS.bg, bg = COLORS.cyan, bold = true })
hl('IncSearch', { fg = COLORS.bg, bg = COLORS.pink, bold = true })
hl('CurSearch', { fg = COLORS.bg, bg = COLORS.pink, bold = true })

hl('LazyNormal', { fg = COLORS.darkfg, bg = COLORS.bg })
hl('MasonNormal', { fg = COLORS.darkfg, bg = COLORS.bg })

hl('GitSignsChange', { fg = HIGHLIGHTS.change })
hl('GitSignsAdd', { fg = HIGHLIGHTS.add })
hl('GitSignsDelete', { fg = HIGHLIGHTS.delete })
hl('GitSignsCurrentLineBlame', { fg = COLORS.darkfg2 })

hl('GitSignsStagedAdd', { fg = HIGHLIGHTS.add })
hl('GitSignsStagedChange', { fg = HIGHLIGHTS.change })
hl('GitSignsStagedDelete', { fg = HIGHLIGHTS.delete })
hl('GitSignsStagedChangedelete', { fg = HIGHLIGHTS.change })

hl('DiffChange', { fg = HIGHLIGHTS.change })
hl('DiffChanged', { fg = HIGHLIGHTS.change })
hl('DiffAdd', { fg = HIGHLIGHTS.add })
hl('DiffAdded', { fg = HIGHLIGHTS.add })
hl('DiffDelete', { fg = HIGHLIGHTS.delete })
hl('DiffRemoved', { fg = HIGHLIGHTS.delete })

hl('Added', { fg = HIGHLIGHTS.add })
hl('Changed', { fg = HIGHLIGHTS.change })
hl('Removed', { fg = HIGHLIGHTS.delete })

hl('PmenuSel', { fg = 'NONE', bg = COLORS.bg3 })
hl('Pmenu', { fg = 'NONE', bg = COLORS.bg2 })

hl('Special', { fg = COLORS.pink })

hl('DiagnosticUnnecessary', { fg = 'NONE', bg = 'NONE' })
hl('DiagnosticSignHint', { fg = HIGHLIGHTS.hint, bold = true })
hl('DiagnosticSignInfo', { fg = HIGHLIGHTS.info, bold = true })
hl('DiagnosticSignWarn', { fg = HIGHLIGHTS.warn, bold = true })
hl('DiagnosticSignError', { fg = HIGHLIGHTS.error, bold = true })
hl('DiagnosticUnderlineHint', { sp = HIGHLIGHTS.hint, undercurl = true })
hl('DiagnosticUnderlineInfo', { sp = HIGHLIGHTS.info, undercurl = true })
hl('DiagnosticUnderlineWarn', { sp = HIGHLIGHTS.warn, undercurl = true })
hl('DiagnosticUnderlineError', { sp = HIGHLIGHTS.error, undercurl = true })
hl('DiagnosticVirtualTextHint', { fg = HIGHLIGHTS.hint, bg = 'NONE' })
hl('DiagnosticVirtualTextInfo', { fg = HIGHLIGHTS.info, bg = 'NONE' })
hl('DiagnosticVirtualTextWarn', { fg = HIGHLIGHTS.warn, bg = 'NONE' })
hl('DiagnosticVirtualTextError', { fg = HIGHLIGHTS.error, bg = 'NONE' })

hl('SnippetTabStop', { bg = COLORS.bg2 })

hl('TroubleNormal', { fg = COLORS.darkfg, bg = COLORS.bg })
hl('TroubleNormalNC', { fg = COLORS.darkfg, bg = COLORS.bg })
hl('TroubleText', { fg = COLORS.darkfg, bg = COLORS.bg })
hl('TroubleDiagnosticsCount', { fg = COLORS.darkfg, bg = 'NONE' })
hl('TroubleFsCount', { fg = COLORS.darkfg, bg = 'NONE' })

hl('BlinkCmpLabel', { fg = COLORS.darkfg, bg = 'NONE' })
hl('BlinkCmpLabelDescription', { fg = COLORS.darkfg, bg = 'NONE' })
hl('BlinkCmpLabelDetail', { fg = COLORS.darkfg, bg = 'NONE' })
hl('BlinkCmpLabelDeprecated', { fg = COLORS.darkfg, bg = 'NONE', strikethrough = true })
hl('BlinkCmpLabelMatch', { fg = COLORS.pink, bg = 'NONE', bold = true })
hl('BlinkCmpMenu', { fg = 'NONE', bg = COLORS.bg })
hl('BlinkCmpMenuBorder', { fg = HIGHLIGHTS.border, bg = COLORS.bg })
hl('BlinkCmpMenuSelection', { fg = 'NONE', bg = COLORS.bg2 })
hl('BlinkCmpDocSeparator', { fg = COLORS.bg2 })
hl('BlinkCmpDoc', { fg = COLORS.darkfg, bg = COLORS.bg })
hl('BlinkCmpDocBorder', { fg = HIGHLIGHTS.border, bg = COLORS.bg })
hl('BlinkCmpSignatureHelp', { fg = COLORS.darkfg, bg = COLORS.bg })
hl('BlinkCmpSignatureHelpBorder', { fg = HIGHLIGHTS.border, bg = COLORS.bg })

hl('BlinkCmpKindClass', { fg = COLORS.blue2, bold = true })
hl('BlinkCmpKindColor', { fg = COLORS.darkpink, bold = true })
hl('BlinkCmpKindConstant', { fg = COLORS.purple, bold = true })
hl('BlinkCmpKindConstructor', { fg = COLORS.pink, bold = true })
hl('BlinkCmpKindEnum', { fg = COLORS.blue2, bold = true })
hl('BlinkCmpKindEnumMember', { fg = COLORS.purple, bold = true })
hl('BlinkCmpKindEvent', { fg = COLORS.green, bold = true })
hl('BlinkCmpKindField', { fg = COLORS.purple, bold = true })
hl('BlinkCmpKindFile', { fg = COLORS.lightblue, bold = true })
hl('BlinkCmpKindFolder', { fg = COLORS.lightblue, bold = true })
hl('BlinkCmpKindFunction', { fg = COLORS.pink, bold = true })
hl('BlinkCmpKindInterface', { fg = COLORS.blue2, bold = true })
hl('BlinkCmpKindKeyword', { fg = COLORS.darkcyan, bold = true })
hl('BlinkCmpKindMethod', { fg = COLORS.pink, bold = true })
hl('BlinkCmpKindModule', { fg = COLORS.darkcyan, bold = true })
hl('BlinkCmpKindOperator', { fg = COLORS.pink, bold = true })
hl('BlinkCmpKindProperty', { fg = COLORS.darkpink, bold = true })
hl('BlinkCmpKindReference', { fg = COLORS.purple, bold = true })
hl('BlinkCmpKindSnippet', { fg = COLORS.blue, bold = true })
hl('BlinkCmpKindStruct', { fg = COLORS.blue2, bold = true })
hl('BlinkCmpKindText', { fg = COLORS.darkfg, bold = true })
hl('BlinkCmpKindTypeParameter', { fg = COLORS.blue2, bold = true })
hl('BlinkCmpKindUnit', { fg = COLORS.blue2, bold = true })
hl('BlinkCmpKindValue', { fg = COLORS.purple, bold = true })
hl('BlinkCmpKindVariable', { fg = COLORS.purple, bold = true })

hl('LspSignatureActiveParameter', { fg = 'NONE', bg = COLORS.bg3 })

hl('FzfLuaBorder', { fg = COLORS.bg3 })
hl('FzfLuaTitle', { fg = COLORS.pink })
hl('FzfLuaHeaderBind', { fg = COLORS.purple })
hl('FzfLuaHeaderText', { fg = COLORS.darkfg })
hl('FzfLuaPathColNr', { fg = COLORS.lightblue })
hl('FzfLuaPathLineNr', { fg = COLORS.blue })
hl('FzfLuaBufNr', { fg = COLORS.lightblue })
hl('FzfLuaBufLineNr', { fg = COLORS.lightblue })

hl('FzfLuaBufFlagCur', { fg = COLORS.purple })
hl('FzfLuaBufFlagAlt', { fg = COLORS.blue })
hl('FzfLuaTabTitle', { fg = COLORS.lightblue })
hl('FzfLuaTabMarker', { fg = COLORS.darkfg })
hl('FzfLuaLiveSym', { fg = COLORS.darkfg })

hl('FzfLuaSearch', { fg = COLORS.pink })
hl('FzfLuaFzfCursorLine', { bold = false })
hl('FzfLuaFzfMatch', { fg = COLORS.pink, bold = true })
hl('FzfLuaFzfPrompt', { fg = COLORS.pink, bold = true })

hl('RenderMarkdownSuccess', { fg = COLORS.green, bg = 'NONE' })
hl('RenderMarkdownInfo', { fg = COLORS.blue, bg = 'NONE' })
hl('RenderMarkdownWarn', { fg = COLORS.pink, bg = 'NONE' })
hl('RenderMarkdownError', { fg = COLORS.pink, bg = 'NONE' })

hl('RenderMarkdownQuote', { fg = COLORS.darkfg })

hl('RenderMarkdownBullet', { fg = COLORS.lightbg, bg = 'NONE' })
hl('RenderMarkdownInlineHighlight', { fg = COLORS.blue, bg = COLORS.bg_blue2 })
hl('RenderMarkdownDash', { fg = COLORS.bg3, bg = 'NONE' })

hl('RenderMarkdownCodeInline', { fg = COLORS.pink, bg = COLORS.bg2 })
hl('RenderMarkdownCode', { fg = 'NONE', bg = COLORS.bg1 })

hl('@markup.heading.1.markdown', { fg = COLORS.pink, bg = COLORS.bg_darkpink, bold = true })
hl('@markup.heading.2.markdown', { fg = COLORS.darkcyan, bg = COLORS.bg_darkcyan, bold = true })
hl('@markup.heading.3.markdown', { fg = COLORS.blue2, bg = COLORS.bg_blue2, bold = true })
hl('@markup.heading.4.markdown', { fg = COLORS.blue2, bg = COLORS.bg_blue2, bold = true })
hl('@markup.heading.5.markdown', { fg = COLORS.blue2, bg = COLORS.bg_blue2, bold = true })
hl('@markup.heading.6.markdown', { fg = COLORS.blue2, bg = COLORS.bg_blue2, bold = true })
hl('RenderMarkdownH1Bg', { bg = COLORS.bg_darkpink })
hl('RenderMarkdownH2Bg', { bg = COLORS.bg_darkcyan })
hl('RenderMarkdownH3Bg', { bg = COLORS.bg_blue2 })
hl('RenderMarkdownH4Bg', { bg = COLORS.bg_blue2 })
hl('RenderMarkdownH5Bg', { bg = COLORS.bg_blue2 })
hl('RenderMarkdownH6Bg', { bg = COLORS.bg_blue2 })

hl('RenderMarkdownTableHead', { fg = COLORS.lightbg, bg = 'NONE' })
hl('RenderMarkdownTableRow', { fg = COLORS.lightbg, bg = 'NONE' })
hl('RenderMarkdownTableFill', { fg = COLORS.lightbg, bg = 'NONE' })

hl('@markup.raw.markdown_inline', { fg = COLORS.pink, bg = COLORS.bg2 })
hl('@markup.list.markdown', { fg = COLORS.pink })
hl('@markup.link.label.markdown_inline', { fg = COLORS.pink, underline = true })
hl('@markup.list.checked', { fg = COLORS.pink })
hl('@markup.list.unchecked', { fg = COLORS.darkfg })
hl('@markup.quote.markdown', { fg = COLORS.darkfg })

hl('@markup.math.typst', { fg = COLORS.purple })

hl('ObsidianTag', { fg = COLORS.pink, bg = COLORS.bg_darkpink })

hl('@punctuation.delimiter', { fg = COLORS.darkfg2, bg = 'NONE' })
hl('@punctuation.bracket', { fg = COLORS.darkfg2, bg = 'NONE' })
hl('@constructor.lua', { fg = COLORS.darkfg2, bg = 'NONE' })
hl('@constructor', { fg = COLORS.pink, bg = 'NONE' })
hl('Number', { fg = COLORS.blue2, bg = 'NONE' })
hl('@variable', { fg = COLORS.darkfg })
hl('@variable.builtin', { fg = COLORS.darkfg })

hl('TreesitterContext', { bg = COLORS.bg })
hl('TreesitterContextBottom', { sp = COLORS.darkfg2, underline = true })

hl('MiniIconsAzure', { fg = COLORS.blue })
hl('MiniIconsBlue', { fg = COLORS.blue2 })
hl('MiniIconsCyan', { fg = COLORS.darkcyan })
hl('MiniIconsGreen', { fg = COLORS.green })
hl('MiniIconsGrey', { fg = COLORS.darkfg })
hl('MiniIconsOrange', { fg = COLORS.pink })
hl('MiniIconsPurple', { fg = COLORS.purple })
hl('MiniIconsRed', { fg = COLORS.red })
hl('MiniIconsYellow', { fg = COLORS.fg })

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
