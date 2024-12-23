vim.api.nvim_set_hl(0, 'Comment', { fg = COLORS.purple, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = COLORS.cyan })

vim.api.nvim_set_hl(0, 'PmenuSel', { fg = 'NONE', bg = COLORS.bg3 })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = 'NONE', bg = COLORS.bg2 })

vim.api.nvim_set_hl(0, 'Special', { fg = COLORS.pink })

vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = 'NONE', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SnippetTabStop', { bg = COLORS.bg2 })

vim.api.nvim_set_hl(0, 'BlinkCmpLabel', { fg = COLORS.darkfg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDescription', { fg = COLORS.darkfg, bg = 'NONE', italic = true })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDetail', { fg = COLORS.darkfg, bg = 'NONE', italic = true })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDeprecated', { fg = COLORS.darkfg, bg = 'NONE', strikethrough = true })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelMatch', { fg = COLORS.pink, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { fg = 'NONE', bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { fg = 'NONE', bg = COLORS.bg3 })

vim.api.nvim_set_hl(0, 'BlinkCmpKindClass', { fg = COLORS.bg, bg = COLORS.blue2 })
vim.api.nvim_set_hl(0, 'BlinkCmpKindColor', { fg = COLORS.bg, bg = COLORS.darkpink })
vim.api.nvim_set_hl(0, 'BlinkCmpKindConstant', { fg = COLORS.bg, bg = COLORS.purple })
vim.api.nvim_set_hl(0, 'BlinkCmpKindConstructor', { fg = COLORS.bg, bg = COLORS.pink })
vim.api.nvim_set_hl(0, 'BlinkCmpKindEnum', { fg = COLORS.bg, bg = COLORS.blue2 })
vim.api.nvim_set_hl(0, 'BlinkCmpKindEnumMember', { fg = COLORS.bg, bg = COLORS.blue2 })
vim.api.nvim_set_hl(0, 'BlinkCmpKindEvent', { fg = COLORS.bg, bg = COLORS.green })
vim.api.nvim_set_hl(0, 'BlinkCmpKindField', { fg = COLORS.bg, bg = COLORS.purple })
vim.api.nvim_set_hl(0, 'BlinkCmpKindFile', { fg = COLORS.bg, bg = COLORS.lightblue })
vim.api.nvim_set_hl(0, 'BlinkCmpKindFolder', { fg = COLORS.bg, bg = COLORS.lightblue })
vim.api.nvim_set_hl(0, 'BlinkCmpKindFunction', { fg = COLORS.bg, bg = COLORS.pink })
vim.api.nvim_set_hl(0, 'BlinkCmpKindInterface', { fg = COLORS.bg, bg = COLORS.blue2 })
vim.api.nvim_set_hl(0, 'BlinkCmpKindKeyword', { fg = COLORS.bg, bg = COLORS.darkcyan })
vim.api.nvim_set_hl(0, 'BlinkCmpKindMethod', { fg = COLORS.bg, bg = COLORS.pink })
vim.api.nvim_set_hl(0, 'BlinkCmpKindModule', { fg = COLORS.bg, bg = COLORS.darkcyan })
vim.api.nvim_set_hl(0, 'BlinkCmpKindOperator', { fg = COLORS.bg, bg = COLORS.pink })
vim.api.nvim_set_hl(0, 'BlinkCmpKindProperty', { fg = COLORS.bg, bg = COLORS.purple })
vim.api.nvim_set_hl(0, 'BlinkCmpKindReference', { fg = COLORS.bg, bg = COLORS.purple })
vim.api.nvim_set_hl(0, 'BlinkCmpKindSnippet', { fg = COLORS.bg, bg = COLORS.blue })
vim.api.nvim_set_hl(0, 'BlinkCmpKindStruct', { fg = COLORS.bg, bg = COLORS.blue2 })
vim.api.nvim_set_hl(0, 'BlinkCmpKindText', { fg = COLORS.bg, bg = COLORS.darkfg })
vim.api.nvim_set_hl(0, 'BlinkCmpKindTypeParameter', { fg = COLORS.bg, bg = COLORS.blue2 })
vim.api.nvim_set_hl(0, 'BlinkCmpKindUnit', { fg = COLORS.bg, bg = COLORS.blue2 })
vim.api.nvim_set_hl(0, 'BlinkCmpKindValue', { fg = COLORS.bg, bg = COLORS.purple })
vim.api.nvim_set_hl(0, 'BlinkCmpKindVariable', { fg = COLORS.bg, bg = COLORS.purple })

vim.api.nvim_set_hl(0, 'HopNextKey', { fg = COLORS.darkpink, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'HopNextKey1', { fg = COLORS.cyan, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'HopNextKey2', { fg = COLORS.darkcyan, bg = 'NONE', bold = false })
vim.api.nvim_set_hl(0, 'HopPreview', { fg = COLORS.bg, bg = COLORS.darkpink })

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

vim.api.nvim_set_hl(0, 'MarkviewBlockQuoteWarn', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewBlockQuoteSpecial', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewBlockQuoteNote', { fg = COLORS.blue2, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewBlockQuoteDefault', { fg = COLORS.blue2, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewBlockQuoteOk', { fg = COLORS.blue2, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewBlockQuoteError', { fg = COLORS.darkpink, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'MarkviewCheckboxCancelled', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewCheckboxChecked', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewCheckboxPending', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewCheckboxProgress', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewCheckboxUnchecked', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewCheckboxStriked', { fg = COLORS.pink, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'MarkviewInlineCode', { fg = COLORS.pink, bg = COLORS.bg2 })
vim.api.nvim_set_hl(0, 'MarkviewCodeInfo', { fg = COLORS.pink, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewCode', { fg = 'NONE', bg = COLORS.bg1 })

vim.api.nvim_set_hl(0, 'MarkviewGradient1', { fg = COLORS.bg3, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'MarkviewIcon1', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon1Fg', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon2', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon2Fg', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon3', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon3Fg', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon4', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon4Fg', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon5', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon5Fg', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon6', { fg = COLORS.bg1, bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'MarkviewIcon6Fg', { fg = COLORS.bg1, bg = COLORS.bg1 })

vim.api.nvim_set_hl(0, 'MarkviewHeading1', { fg = COLORS.pink, bg = COLORS.bg2, bold = true })
vim.api.nvim_set_hl(0, 'MarkviewHeading2', { fg = COLORS.darkcyan, bg = COLORS.bg2, bold = true })
vim.api.nvim_set_hl(0, 'MarkviewHeading3', { fg = COLORS.blue2, bg = COLORS.bg2, bold = true })
vim.api.nvim_set_hl(0, 'MarkviewHeading4', { fg = COLORS.blue2, bg = COLORS.bg2, bold = true })
vim.api.nvim_set_hl(0, 'MarkviewHeading5', { fg = COLORS.blue2, bg = COLORS.bg2, bold = true })
vim.api.nvim_set_hl(0, 'MarkviewHeading6', { fg = COLORS.blue2, bg = COLORS.bg2, bold = true })

vim.api.nvim_set_hl(0, 'MarkviewListItemStar', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewListItemPlus', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewListItemMinus', { fg = COLORS.pink, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'MarkviewEmail', { fg = COLORS.purple, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewImageLink', { fg = COLORS.purple, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewHyperlink', { fg = COLORS.pink, bg = 'NONE', underline = true })

vim.api.nvim_set_hl(0, 'MarkviewTableHeader', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewTableBorder', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewTableAlignCenter', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewTableAlignLeft', { fg = COLORS.pink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MarkviewTableAlignRight', { fg = COLORS.pink, bg = 'NONE' })

vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { fg = COLORS.pink, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = COLORS.darkcyan, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { fg = COLORS.blue2, bold = true })
vim.api.nvim_set_hl(0, '@markup.raw.markdown_inline', { fg = COLORS.pink, bg = COLORS.bg2 })
vim.api.nvim_set_hl(0, '@markup.list.markdown', { fg = COLORS.pink })

vim.api.nvim_set_hl(0, 'MdHighlight', { fg = COLORS.bg, bg = COLORS.blue2 })

