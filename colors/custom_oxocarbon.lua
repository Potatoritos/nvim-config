if vim.g.colors_name then
    vim.cmd('hi clear')
end

vim.g.colors_name = 'custom_oxocarbon'

local hl = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

local colors = {
    bg = '#161616',
    bg_diff = '#202020',
    bg_light = '#262626',
    bg_lighter = '#393939',
    bg_lightest = '#515156', -- #343a40
    fg_dark = '#6d6e78',
    fg = '#b3bbc4',
    fg_light = '#dde1e6',
    cyan_dark = '#08bdba',
    cyan = '#3ddbd9',
    azure = '#33b1ff',
    blue = '#78a9ff',
    blue_light = '#82cfff',
    pink = '#ff7eb6',
    pink_dark = '#ee5396',
    green = '#20c997',
    purple = '#be95ff',
    secondary = {
        fg = '#696e73',
        cyan_dark = '#136f6d',
        cyan = '#26817f',
        pink = '#964a6b',
        pink_dark = '#96355e',
        blue = '#466396',
        purple = '#6f5796',
        azure = '#216896',
        green = '#197658',
    },
    bg_cyan_dark = '#153332',
    bg_green = '#17362a',
    bg_pink = '#5c2f42',
    orange = '#f58549',
}
-- colors = {
--     bg = '#ffffff',
--     bg_light = '#fafafa',
--     bg_lighter = '#dddddd',
--     bg_lightest = '#bfbfbf',
--     fg_dark = '#90a4ae',
--     fg = '#37474f',
--     fg_light = '#525252',
--     cyan_dark = '#08bdba',
--     cyan = '#ff7eb6',
--     azure = '#0f62fe',
--     blue = '#ee5396',
--     blue_light = '#ffab91',
--     pink = '#673ab7',
--     pink_dark = '#ff6f00',
--     green = '#42be65',
--     purple = '#be95ff',
-- }

hl('Cursor', { fg = colors.bg, bg = colors.fg_light })
hl('TermCursor', { link = 'Cursor' })
hl('TermCursorNC', { link = 'Cursor' })

hl('CursorLine', {})
hl('CursorColumn', {})
hl('CursorLineNr', {})
hl('QuickFixLine', {})
hl('LineNr', { fg = colors.bg_lightest })
hl('ColorColumn', { bg = colors.bg })

hl('Normal', { fg = colors.fg, bg = colors.bg })
hl('NormalNC', { link = 'Normal' })
hl('NormalFloat', { link = 'Normal' })
hl('FloatBorder', { fg = colors.bg_light, bg = colors.bg })

hl('StatusLine', { fg = colors.fg, bg = colors.bg })
hl('StatusLineNC', { link = 'StatusLine' })

hl('StatusReplace', { bg = colors.bg, fg = colors.azure, bold = true })
hl('StatusInsert', { bg = colors.bg, fg = colors.pink, bold = true })
hl('StatusVisual', { bg = colors.bg, fg = colors.pink_dark, bold = true })
hl('StatusTerminal', { bg = colors.bg, fg = colors.purple, bold = true })
hl('StatusNormal', { bg = colors.bg, fg = colors.cyan_dark, bold = true })
hl('StatusCommand', { bg = colors.bg, fg = colors.purple, bold = true })
hl('StatusSelect', { bg = colors.bg, fg = colors.cyan, bold = true })
hl('StatusOther', { bg = colors.bg, fg = colors.green, bold = true })

hl('TabLine', { link = 'StatusLine' })
hl('TabLineFill', { link = 'TabLine' })
hl('TabLineSel', { link = 'TabLine' })

hl('VertSplit', { fg = colors.bg_light, bg = colors.bg })
hl('WinSeparator', { fg = colors.bg_light, bg = colors.bg })

hl('Folded', { fg = colors.bg_lightest, bg = colors.bg })
hl('FoldColumn', { fg = colors.fg_dark, bg = colors.bg })

hl('SignColumn', { fg = colors.fg_dark, bg = colors.bg })

hl('Pmenu', { link = 'Normal' })
hl('PmenuSel', { bg = colors.bg_light })
hl('PmenuSbar', { bg = colors.bg_light })
hl('PmenuThumb', { bg = colors.bg_lighter })
hl('SpecialKey', { fg = colors.fg_dark, bg = colors.bg_light })

hl('WildMenu', { fg = colors.cyan, bg = colors.bg })

hl('Substitute', { fg = colors.bg, bg = colors.cyan })
hl('Search', { fg = colors.bg, bg = colors.cyan, bold = true })
hl('IncSearch', { fg = colors.bg, bg = colors.pink, bold = true })
hl('CurSearch', { fg = colors.bg, bg = colors.pink, bold = true })

hl('Visual', { bg = colors.bg_lighter })
hl('VisualNOS', { link = 'Visual' })
hl('SnippetTabStop', { bg = colors.bg_lighter })

hl('Directory', { fg = colors.azure })
hl('EndOfBuffer', { fg = colors.bg_lighter })

hl('TooLong', { bg = colors.bg_lighter })
hl('Debug', { fg = colors.green })

hl('MatchParen', { bg = colors.bg_lighter, underline = true })
hl('Bold', { bold = true })
hl('Italic', { italic = true })
hl('Underlined', { underline = true })
hl('NonText', { fg = colors.fg_dark })
hl('Title', { fg = colors.fg })

hl('Macro', { fg = colors.cyan_dark })
hl('Boolean', { fg = colors.blue, italic = true })
hl('Character', { fg = colors.purple })
hl('Comment', { fg = colors.fg_dark })
hl('Conceal', {})
hl('Conditional', { fg = colors.blue })
hl('Constant', { fg = colors.fg })
hl('Decorator', { fg = colors.pink })
hl('Define', { fg = colors.blue })
hl('Delimiter', { fg = colors.fg_dark })
hl('Exception', { fg = colors.blue })
hl('Number', { fg = colors.blue })
hl('Float', { link = 'Number' })
hl('Function', { fg = colors.blue })
hl('Identifier', { fg = colors.fg })
hl('Include', { fg = colors.blue })
hl('Keyword', { fg = colors.blue })
hl('Label', { fg = colors.blue })
hl('Operator', { fg = colors.blue })
hl('PreProc', { fg = colors.blue })
hl('Special', { fg = colors.pink })
hl('SpecialChar', { fg = colors.fg })
hl('SpecialComment', { fg = colors.cyan })
hl('Statement', { fg = colors.blue })
hl('StorageClass', { fg = colors.blue })
hl('String', { fg = colors.purple })
hl('Structure', { fg = colors.blue })
hl('Tag', { fg = colors.fg })
hl('Todo', { fg = colors.green })
hl('Type', { fg = colors.blue })
hl('Typedef', { fg = colors.blue })

hl('@comment', { link = 'Comment' })
hl('@error', { link = 'Error' })
hl('@operator', { link = 'Operator' })
hl('@punctuation.delimeter', { link = 'Delimiter' })
hl('@punctuation.bracket', { link = 'Delimiter' })
hl('@punctuation.special', { link = 'Delimiter' })
hl('@string', { link = 'String' })
hl('@string.regex', { link = 'String' })
hl('@string.escape', { link = 'String' })
hl('@string.escape.markdown_inline', { link = 'Normal' })
hl('@character', { link = 'Character' })
hl('@boolean', { link = 'Boolean' })
hl('@number', { link = 'Number' })
hl('@float', { link = 'Float' })
hl('@function', { fg = colors.pink, bold = true })
hl('@function.builtin', { link = '@function' })
hl('@function.macro', { fg = colors.cyan_dark, bold = true })
hl('@function.latex', { fg = colors.purple })
hl('@method', { link = '@function' })
hl('@constructor', { link = '@function' })
hl('@constructor.lua', { link = 'Delimiter' })
hl('@parameter', { fg = colors.fg })
hl('@keyword', { link = 'Keyword' })
hl('@keyword.function', { link = 'Keyword' })
hl('@keyword.operator', { link = 'Keyword' })
hl('@conditional', { fg = colors.blue })
hl('@repeat', { fg = colors.blue })
hl('@label', { fg = colors.blue_light })
hl('@label.markdown', { fg = colors.fg_dark })
hl('@include', { fg = colors.blue })
hl('@exception', { fg = colors.blue })
hl('@type', { link = 'Type' })
hl('@type.builtin', { link = 'Type' })
hl('@attribute', { fg = colors.blue_light })
hl('@field', { fg = colors.fg })
hl('@property', { fg = colors.fg })
hl('@variable', { fg = colors.fg })
hl('@variable.builtin', { fg = colors.fg })
hl('@variable.builtin.java', { fg = colors.fg, italic = true })
hl('@constant', { fg = colors.purple })
hl('@constant.builtin', { fg = colors.cyan_dark, italic = true })
hl('@constant.builtin.rust', { fg = colors.cyan_dark })
hl('@constant.macro', { fg = colors.cyan_dark })
hl('@namespace', { fg = colors.cyan_dark })
hl('@symbol', { fg = colors.blue_light, bold = true })
hl('@text', { fg = colors.fg })
hl('@text.strong', { bold = true })
hl('@text.emphasis', { italic = true })
hl('@text.underline', { underline = true })
hl('@text.strike', { strikethrough = true })
hl('@text.title', {})
hl('@text.literal', {})
hl('@text.uri', { fg = colors.pink_dark, underline = true })
hl('@tag', { fg = colors.blue })
hl('@tag.attribute', { fg = colors.blue_light })
hl('@tag.delimeter', { fg = colors.blue_light })
hl('@reference', { fg = colors.fg })

hl('@lsp.type.class', { link = 'Structure' })
hl('@lsp.type.decorator', { link = 'Decorator' })
hl('@lsp.type.decorator.rust', { link = 'Macro' })
hl('@lsp.type.decorator.markdown', { fg = colors.cyan_dark })
hl('@lsp.type.function', { link = '@function' })
hl('@lsp.type.macro', { link = 'Macro' })
hl('@lsp.type.method', { link = '@function' })
hl('@lsp.type.struct', { link = 'Structure' })
hl('@lsp.type.type', { link = 'Type' })
hl('@lsp.type.typeParameter', { link = 'Typedef' })
hl('@lsp.type.selfParameter', { link = '@variable.builtin' })
hl('@lsp.type.builtinConstant', { link = '@constant.builtin' })
hl('@lsp.type.magicFunction', { link = '@function.builtin' })
hl('@lsp.type.boolean', { link = '@boolean' })
hl('@lsp.type.builtinType', { link = '@type.builtin' })
hl('@lsp.type.comment', { link = '@comment' })
hl('@lsp.type.enum', { link = '@type' })
hl('@lsp.type.enumMember', { fg = colors.cyan_dark })
hl('@lsp.type.escapeSequence', { link = '@string.escape' })
hl('@lsp.type.formatSpecifier', { link = '@punctuation.special' })
hl('@lsp.type.keyword', { link = '@keyword' })
hl('@lsp.type.namespace', { link = '@namespace' })
hl('@lsp.type.number', { link = '@number' })
hl('@lsp.type.operator', { link = '@operator' })
hl('@lsp.type.operator.cpp', {})
hl('@lsp.type.parameter', { link = '@parameter' })
hl('@lsp.type.property', { link = '@property' })
hl('@lsp.type.selfKeyword', { link = '@variable.builtin' })
hl('@lsp.type.string.rust', { link = '@string' })
hl('@lsp.type.typeAlias', { link = '@type.definition' })
hl('@lsp.type.unresolvedReference', { link = 'Error' })
hl('@lsp.type.variable', { link = '@variable' })
hl('@lsp.mod.readonly', { link = '@constant' })
hl('@lsp.mod.typeHint', { link = 'Type' })
hl('@lsp.mod.builtin', { link = 'Special' })
hl('@lsp.typemod.class.defaultLibrary', { link = '@type.builtin' })
hl('@lsp.typemod.class.defaultLibrary.cpp', {})
hl('@lsp.typemod.enum.defaultLibrary', { link = '@type.builtin' })
-- hl('@lsp.typemod.enumMember.defaultLibrary', { fg = colors.cyan_dark })
hl('@lsp.typemod.function.defaultLibrary', { link = '@function.builtin' })
hl('@lsp.typemod.keyword.async', { link = '@keyword.coroutine' })
hl('@lsp.typemod.macro.defaultLibrary', { link = '@function.builtin' })
hl('@lsp.typemod.method.defaultLibrary', { link = '@function.builtin' })
hl('@lsp.typemod.operator.injected', { link = '@operator' })
hl('@lsp.typemod.string.injected', { link = '@string' })
hl('@lsp.typemod.operator.controlFlow', { link = '@exception' })
hl('@lsp.typemod.keyword.documentation', { link = 'Special' })
hl('@lsp.typemod.variable.global', { link = '@constant' })
hl('@lsp.typemod.variable.static', { link = '@constant' })
hl('@lsp.typemod.variable.defaultLibrary', { link = 'Special' })
hl('@lsp.typemod.function.builtin', { link = '@function.builtin' })
hl('@lsp.typemod.function.readonly', { link = '@method' })
hl('@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })
hl('@lsp.typemod.variable.injected', { link = '@variable' })
hl('@lsp.typemod.delim.math.typst', { link = 'Delimiter' })
hl('@lsp.typemod.selfKeyword', { italic = true })

hl('LspSignatureActiveParameter', { bg = colors.bg_lighter })
hl('LspInlayHint', { bg = colors.bg_light, fg = colors.fg_dark })

hl('SpellBad', { sp = colors.pink_dark, undercurl = true })
hl('SpellCap', { sp = colors.purple, undercurl = true })
hl('SpellLocal', { sp = colors.cyan_dark, undercurl = true })
hl('SpellRare', { sp = colors.azure, undercurl = true })

hl('Error', { fg = colors.pink_dark })

hl('ErrorMsg', { fg = colors.pink_dark })
hl('WarningMsg', { fg = colors.purple })
hl('ModeMsg', { fg = colors.fg })
hl('MoreMsg', { fg = colors.cyan })
hl('Question', { fg = colors.fg })

hl('NvimInternalError', { link = 'Error' })

hl('DiagnosticOk', { fg = colors.azure })
hl('DiagnosticUnnecessary', { sp = colors.secondary.fg, undercurl = true })
hl('DiagnosticHint', { fg = colors.fg })
hl('DiagnosticInfo', { fg = colors.azure })
hl('DiagnosticWarn', { fg = colors.purple })
hl('DiagnosticError', { fg = colors.pink_dark })
hl('DiagnosticSignHint', { fg = colors.fg_dark, bold = true })
hl('DiagnosticSignInfo', { fg = colors.secondary.azure, bold = true })
hl('DiagnosticSignWarn', { fg = colors.secondary.purple, bold = true })
hl('DiagnosticSignError', { fg = colors.secondary.pink_dark, bold = true })
hl('DiagnosticUnderlineHint', { sp = colors.secondary.fg, undercurl = true })
hl('DiagnosticUnderlineInfo', { sp = colors.secondary.azure, undercurl = true })
hl('DiagnosticUnderlineWarn', { sp = colors.secondary.purple, undercurl = true })
hl('DiagnosticUnderlineError', { sp = colors.secondary.pink_dark, undercurl = true })
hl('DiagnosticVirtualTextHint', { fg = colors.secondary.fg })
hl('DiagnosticVirtualTextInfo', { fg = colors.secondary.azure })
hl('DiagnosticVirtualTextWarn', { fg = colors.secondary.purple })
hl('DiagnosticVirtualTextError', { fg = colors.secondary.pink_dark })
hl('DiagnosticVirtualLinesHint', { fg = colors.secondary.fg })
hl('DiagnosticVirtualLinesInfo', { fg = colors.secondary.azure })
hl('DiagnosticVirtualLinesWarn', { fg = colors.secondary.purple })
hl('DiagnosticVirtualLinesError', { fg = colors.secondary.pink_dark })

hl('HealthError', { fg = colors.pink_dark })
hl('HealthWarning', { fg = colors.purple })
hl('HealthSuccess', { fg = colors.green })

hl('Added', { fg = colors.cyan_dark })
hl('DiffAdd', { fg = colors.cyan_dark })
hl('GitSignsAdd', { link = 'DiffAdd' })
hl('GitSignsStagedAdd', { link = 'GitSignsAdd' })
hl('MiniDiffSignAdd', { fg = colors.secondary.cyan, bold = true })
hl('MiniDiffOverAdd', { bg = colors.bg_cyan_dark })

hl('DiffText', { fg = colors.secondary.azure, bg = colors.bg_lighter, bold = true })
hl('Changed', { fg = colors.azure })
hl('DiffChange', { fg = colors.azure })
hl('GitSignsChange', { link = 'DiffChange' })
hl('GitSignsChangedelete', { link = 'GitSignsChange' })
hl('GitSignsStagedChange', { link = 'GitSignsChange' })
hl('MiniDiffSignChange', { fg = colors.secondary.azure, bold = true })
hl('MiniDiffOverChange', { link = 'DiffText' })
hl('MiniDiffOverChangeBuf', { bg = colors.bg_lighter })
hl('MiniDiffOverContext', { fg = colors.secondary.azure, bg = colors.bg_diff })
hl('MiniDiffOverContextBuf', {})

hl('Removed', { fg = colors.pink })
hl('DiffDelete', { fg = colors.pink })
hl('GitSignsDelete', { link = 'DiffDelete' })
hl('GitSignsStagedDelete', { link = 'GitSignsDelete' })
hl('GitSignsStagedChangedelete', { link = 'GitSignsDelete' })
hl('GitSignsStagedTopdelete', { link = 'GitSignsDelete' })
hl('MiniDiffSignDelete', { fg = colors.secondary.pink, bold = true })
hl('MiniDiffOverDelete', { fg = colors.secondary.pink, bg = colors.bg_diff })

hl('GitSignsUntracked', { link = 'GitSignsAdd' })
hl('GitSignsStagedUntracked', { link = 'GitSignsAdd' })
hl('GitSignsCurrentLineBlame', { fg = colors.fg_dark })

hl('BlinkCmpLabel', { fg = colors.fg })
hl('BlinkCmpLabelDescription', { fg = colors.fg })
hl('BlinkCmpLabelDetail', { fg = colors.fg })
hl('BlinkCmpLabelDeprecated', { fg = colors.fg, strikethrough = true })
hl('BlinkCmpLabelMatch', { fg = colors.pink, bold = true })
hl('BlinkCmpMenu', { bg = colors.bg })
hl('BlinkCmpMenuBorder', { fg = colors.bg_light, bg = colors.bg })
hl('BlinkCmpMenuSelection', { bg = colors.bg_light })
hl('BlinkCmpDocSeparator', { fg = colors.bg_light })
hl('BlinkCmpDoc', { fg = colors.fg, bg = colors.bg })
hl('BlinkCmpDocBorder', { fg = colors.bg_light, bg = colors.bg })
hl('BlinkCmpSignatureHelp', { fg = colors.fg, bg = colors.bg })
hl('BlinkCmpSignatureHelpBorder', { fg = colors.bg_light, bg = colors.bg })

hl('BlinkCmpKindClass', { fg = colors.blue, bold = true })
hl('BlinkCmpKindColor', { fg = colors.pink_dark, bold = true })
hl('BlinkCmpKindConstant', { fg = colors.purple, bold = true })
hl('BlinkCmpKindConstructor', { fg = colors.pink, bold = true })
hl('BlinkCmpKindEnum', { fg = colors.blue, bold = true })
hl('BlinkCmpKindEnumMember', { fg = colors.purple, bold = true })
hl('BlinkCmpKindEvent', { fg = colors.green, bold = true })
hl('BlinkCmpKindField', { fg = colors.purple, bold = true })
hl('BlinkCmpKindFile', { fg = colors.blue_light, bold = true })
hl('BlinkCmpKindFolder', { fg = colors.blue_light, bold = true })
hl('BlinkCmpKindFunction', { fg = colors.pink, bold = true })
hl('BlinkCmpKindInterface', { fg = colors.blue, bold = true })
hl('BlinkCmpKindKeyword', { fg = colors.cyan_dark, bold = true })
hl('BlinkCmpKindMethod', { fg = colors.pink, bold = true })
hl('BlinkCmpKindModule', { fg = colors.cyan_dark, bold = true })
hl('BlinkCmpKindOperator', { fg = colors.pink, bold = true })
hl('BlinkCmpKindProperty', { fg = colors.pink_dark, bold = true })
hl('BlinkCmpKindReference', { fg = colors.purple, bold = true })
hl('BlinkCmpKindSnippet', { fg = colors.azure, bold = true })
hl('BlinkCmpKindStruct', { fg = colors.blue, bold = true })
hl('BlinkCmpKindText', { fg = colors.fg, bold = true })
hl('BlinkCmpKindTypeParameter', { fg = colors.blue, bold = true })
hl('BlinkCmpKindUnit', { fg = colors.blue, bold = true })
hl('BlinkCmpKindValue', { fg = colors.purple, bold = true })
hl('BlinkCmpKindVariable', { fg = colors.purple, bold = true })

hl('SnacksPickerIconFile', { link = 'BlinkCmpKindFile' })
hl('SnacksPickerIconField', { link = 'BlinkCmpKindField' })
hl('SnacksPickerIconMethod', { link = 'BlinkCmpKindMethod' })
hl('SnacksPickerIconArray', { link = 'BlinkCmpKindVariable' })
-- hl('SnacksPickerIconBoolean', { link = 'BlinkCmpKindBoolean' })
-- -- hl('SnacksPickerIconCategory', { link = 'BlinkCmpKindCategory' })
hl('SnacksPickerIconConstructor', { link = 'BlinkCmpKindConstructor' })
hl('SnacksPickerIconEnum', { link = 'BlinkCmpKindEnum' })
hl('SnacksPickerIconEnumMember', { link = 'BlinkCmpKindEnumMember' })
hl('SnacksPickerIconFunction', { link = 'BlinkCmpKindFunction' })
hl('SnacksPickerIconInterface', { link = 'BlinkCmpKindInterface' })
-- hl('SnacksPickerIconKey', { link = 'BlinkCmpKindKey' })
hl('SnacksPickerIconModule', { link = 'BlinkCmpKindModule' })
-- hl('SnacksPickerIconName', { link = 'BlinkCmpKindName' })
-- hl('SnacksPickerIconNamespace', { link = 'BlinkCmpKindNamespace' })
hl('SnacksPickerIconOperator', { link = 'BlinkCmpKindOperator' })
hl('SnacksPickerIconPackage', { link = 'BlinkCmpKindModule' })
-- hl('SnacksPickerIconString', { link = 'BlinkCmpKindString' })
hl('SnacksPickerIconStruct', { link = 'BlinkCmpKindStruct' })
hl('SnacksPickerIconTypeParameter', { link = 'BlinkCmpKindTypeParameter' })
hl('SnacksPickerMatch', { fg = colors.pink, bold = true })

hl('RenderMarkdownInlineHighlight', { bg = colors.bg_pink })
hl('RenderMarkdownQuote', { fg = colors.bg_lightest })

hl('@markup.heading.1.markdown', { fg = colors.pink, bold = true })
hl('@markup.heading.2.markdown', { fg = colors.cyan_dark, bold = true })
hl('@markup.heading.3.markdown', { fg = colors.azure, bold = true })
hl('@markup.heading.4.markdown', { link = '@markup.heading.3.markdown' })
hl('@markup.heading.5.markdown', { link = '@markup.heading.3.markdown' })
hl('@markup.heading.6.markdown', { link = '@markup.heading.3.markdown' })

hl('RenderMarkdownTableHead', { fg = colors.bg_lightest })
hl('RenderMarkdownTableRow', { fg = colors.bg_lightest })
hl('RenderMarkdownTableFill', { fg = colors.bg_lightest })

hl('@markup.raw.markdown_inline', { fg = colors.pink, bg = colors.bg_light })
hl('@markup.raw.block.markdown', { fg = colors.fg_dark })
hl('@markup.list.markdown', { fg = colors.fg_dark })
hl('@markup.link.label.markdown_inline', { fg = colors.pink, underline = true })
hl('@markup.list.checked', { fg = colors.pink })
hl('@markup.list.unchecked', { fg = colors.fg_dark })
hl('@markup.quote.markdown', { fg = colors.fg })
hl('@markup.math', { fg = colors.fg })

hl('TreesitterContext', { bg = colors.bg })
hl('TreesitterContextBottom', { sp = colors.fg_dark, underline = true })

hl('SnacksPickerDir', { fg = colors.fg_dark })
hl('SnacksPickerTree', { fg = colors.bg_lighter })
hl('SnacksPickerCursorLine', { bg = colors.bg_light })
hl('SnacksPickerListCursorLine', { link = 'SnacksPickerCursorLine' })
hl('SnacksPickerPreviewCursorLine', { link = 'SnacksPickerCursorLine' })
hl('SnacksStatusColumnMark', { fg = colors.bg_lightest })

hl('FlashMatch', { fg = colors.bg, bg = colors.pink, bold = true })
hl('FlashCurrent', { link = 'FlashMatch' })
hl('FlashLabel', { fg = colors.bg, bg = colors.cyan, bold = true })

hl('TabpageActive', { fg = colors.fg })
hl('TabpageInactive', { fg = colors.fg_dark })

hl('MiniIconsAzure', { fg = colors.azure, bold = true })
hl('MiniIconsBlue', { fg = colors.blue, bold = true })
hl('MiniIconsCyan', { fg = colors.cyan_dark, bold = true })
hl('MiniIconsGreen', { fg = colors.green, bold = true })
hl('MiniIconsGrey', { fg = colors.fg, bold = true })
hl('MiniIconsOrange', { fg = colors.orange, bold = true })
hl('MiniIconsPurple', { fg = colors.purple, bold = true })
hl('MiniIconsRed', { fg = colors.pink, bold = true })
hl('MiniIconsYellow', { fg = colors.pink, bold = true })

hl('MiniClueBorder', { fg = colors.bg_lighter })
hl('MiniClueDescGroup', { fg = colors.fg_dark, italic = true })
hl('MiniClueNextKey', { fg = colors.blue })
hl('MiniClueSeparator', { fg = colors.bg_light })
hl('MiniClueTitle', { fg = colors.blue })

hl('MasonMuted', { fg = colors.fg_dark })
hl('MasonBackdrop', { bg = colors.bg })
hl('MasonHighlight', { fg = colors.azure })
hl('MasonHighlightSecondary', { fg = colors.pink })
hl('MasonMutedBlock', { fg = colors.fg_dark, bg = colors.bg_light })
hl('MasonHighlightBlock', { fg = colors.blue, bg = colors.bg_light })
hl('MasonHighlightBlockSecondary', { fg = colors.pink, bg = colors.bg_light })
-- hl('MasonHeading', {})
-- hl('MasonError', {})
-- hl('MasonWarning', {})
hl('MasonHeader', { fg = colors.pink, bold = true })
hl('MasonMutedBlockBold', { fg = colors.fg_dark, bg = colors.bg_light, bold = true })
hl('MasonHeaderSecondary', { fg = colors.pink, bg = colors.bg_light, bold = true })
hl('MasonHighlightBlockBold', { fg = colors.pink, bg = colors.bg_light, bold = true })
hl('MasonLink', { fg = colors.pink, underline = true })
hl('MasonHighlightBlockBoldSecondary', { fg = colors.blue, bg = colors.bg_light, bold = true })
-- hl('MasonNormal', {})

vim.g.terminal_color_0 = colors.bg
vim.g.terminal_color_1 = colors.pink
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.azure
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.purple
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.fg
vim.g.terminal_color_8 = colors.fg_dark
vim.g.terminal_color_9 = colors.pink_dark
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.azure
vim.g.terminal_color_12 = colors.blue
vim.g.terminal_color_13 = colors.purple
vim.g.terminal_color_14 = colors.cyan_dark
vim.g.terminal_color_15 = colors.fg
