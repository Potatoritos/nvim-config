vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'
vim.o.showmode = false

vim.o.breakindent = true
vim.o.autoindent = true
vim.g.python_indent = {
    open_paren = 4,
    closed_paren_align_last_line = false,
}
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 500

vim.o.timeoutlen = 500

vim.o.splitright = true
vim.o.splitbelow = true

-- vim.o.list = true
-- vim.o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.background = 'dark'

-- vim.o.completeopt = { 'menuone', 'noinsert' }
-- vim.o.shortmess = vim.o.shortmess + { c = true }
vim.o.cursorline = false

vim.o.pumheight = 10

vim.o.conceallevel = 2
vim.o.signcolumn = 'yes:2'

vim.o.wrap = true
vim.o.linebreak = true
vim.o.textwidth = 120

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = require('foldtext')
vim.o.fillchars = 'fold: '

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
    float = {
        border = 'single',
    },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })
