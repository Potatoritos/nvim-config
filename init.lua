vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

require('globals')
require('options')
require('lazy_setup')
require('autocmds')
require('keymaps')
require('style')
