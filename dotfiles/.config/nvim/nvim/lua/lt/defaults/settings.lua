vim.o.showmatch = true
-- vim.o.nohlsearch
vim.o.hidden = true
vim.o.errorbells = false

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.wrap = false

vim.o.relativenumber = true
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = '/home/lucatrazzi/.nvim/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8

-- Give more space for displaying messages.
vim.o.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 50

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Don't show the dumb matching stuff.
vim.cmd [[set shortmess+=c]]

-- vim.o.colorcolumn=80

vim.o.signcolumn = 'yes'

vim.g.loaded_matchparen = 1
vim.g.mapleader = ' '

vim.o.cursorline = false
vim.o.cursorcolumn = false

-- -- done by status bar
vim.o.showmode = false
