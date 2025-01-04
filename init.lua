vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

require 'globals'
require 'style'
require 'lazy_setup'
require 'style' -- intentionally duplicated
require 'options'
require 'autocmds'
require 'keymaps'
