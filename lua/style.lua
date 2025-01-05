local symbols = { Error = '󰅙', Info = 'i', Hint = '󰌵', Warn = '' }

for name, icon in pairs(symbols) do
    local hl = 'DiagnosticSign' .. name
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

vim.api.nvim_set_hl(0, 'Comment', { fg = COLORS.darkfg2, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = COLORS.fg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Normal', { fg = COLORS.fg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = COLORS.darkfg, bg = COLORS.bg1 })

vim.api.nvim_set_hl(0, 'LineNr', { fg = COLORS.darkfg2, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'CurSearch', { fg = COLORS.bg, bg = COLORS.darkpink })

vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = COLORS.cyan })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = COLORS.darkfg })
vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = COLORS.darkfg2 })

vim.api.nvim_set_hl(0, 'GitSignsStagedAdd', { fg = COLORS.cyan })
vim.api.nvim_set_hl(0, 'GitSignsStagedChange', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, 'GitSignsStagedDelete', { fg = COLORS.darkfg })
vim.api.nvim_set_hl(0, 'GitSignsStagedChangedelete', { fg = COLORS.darkfg })

vim.api.nvim_set_hl(0, 'DiffChange', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, 'DiffChanged', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = COLORS.cyan })
vim.api.nvim_set_hl(0, 'DiffAdded', { fg = COLORS.cyan })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = COLORS.darkfg })
vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = COLORS.darkfg })

vim.api.nvim_set_hl(0, 'Added', { fg = COLORS.cyan })
vim.api.nvim_set_hl(0, 'Changed', { fg = COLORS.pink })
vim.api.nvim_set_hl(0, 'Removed', { fg = COLORS.darkfg })

vim.api.nvim_set_hl(0, 'PmenuSel', { fg = 'NONE', bg = COLORS.bg3 })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = 'NONE', bg = COLORS.bg2 })

vim.api.nvim_set_hl(0, 'Special', { fg = COLORS.pink })

vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = 'NONE', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { fg = 'NONE', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { fg = 'NONE', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { fg = 'NONE', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = 'NONE', bg = 'NONE' })

vim.api.nvim_set_hl(0, 'SnippetTabStop', { bg = COLORS.bg2 })

vim.api.nvim_set_hl(0, 'BlinkCmpLabel', { fg = COLORS.darkfg, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDescription', { fg = COLORS.darkfg, bg = 'NONE', italic = true })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDetail', { fg = COLORS.darkfg, bg = 'NONE', italic = true })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelDeprecated', { fg = COLORS.darkfg, bg = 'NONE', strikethrough = true })
vim.api.nvim_set_hl(0, 'BlinkCmpLabelMatch', { fg = COLORS.pink, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { fg = 'NONE', bg = COLORS.bg1 })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { fg = 'NONE', bg = COLORS.bg3 })
vim.api.nvim_set_hl(0, 'BlinkCmpDocSeparator', { fg = COLORS.bg3 })

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

vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = 'NONE', bg = COLORS.bg3 })

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
