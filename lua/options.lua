vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.showtabline = 0

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

vim.o.timeoutlen = 1000

vim.o.splitright = true
vim.o.splitbelow = true

-- vim.o.list = true
-- vim.o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 5

vim.o.background = 'dark'

-- vim.opt.completeopt = { 'menuone', 'noinsert' }
-- vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.o.cursorline = false

vim.o.pumheight = 10

vim.o.conceallevel = 2
vim.o.signcolumn = 'yes:1'

vim.o.wrap = true
vim.o.linebreak = true
vim.o.textwidth = 120

-- vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append({ fold = ' ', vert = '+' })

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
        linehl = {},
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticVirtualTextError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticVirtualTextWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticVirtualTextInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticVirtualTextHint',
        },
    },
    virtual_text = false,
    severity_sort = true,
    underline = true,
})

vim.o.winborder = 'rounded'
