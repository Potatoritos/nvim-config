vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 500

vim.opt.timeoutlen = 500

vim.opt.splitright = true
vim.opt.splitbelow = true

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.background = 'dark'

vim.opt.completeopt = { 'menuone', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.cursorline = false

vim.opt.pumheight = 10

vim.opt.conceallevel = 2

vim.opt.autoindent = true

vim.opt.signcolumn = 'yes:2'

vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
