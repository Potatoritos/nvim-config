vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.opt.breakindent = true
vim.opt.autoindent = true
vim.g.python_indent = {
    open_paren = 4,
    closed_paren_align_last_line = false,
}
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 500

vim.opt.timeoutlen = 500

vim.opt.splitright = true
vim.opt.splitbelow = true

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.background = 'dark'

vim.opt.completeopt = { 'menuone', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.cursorline = false

vim.opt.pumheight = 10

vim.opt.conceallevel = 2
vim.opt.signcolumn = 'yes:2'

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 120

vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

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
