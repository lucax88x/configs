vim.cmd('syntax on')

vim.cmd('colorscheme gruvbox')

vim.o.termguicolors = true
vim.o.background = 'dark'

vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_sign_column = 'dark0_hard'
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_number_column = 'dark0_hard'
vim.g.gruvbox_invert_tabline = true
-- vim.g.gruvbox_tabline_sel = 'green'


vim.cmd('highlight ColorColumn ctermbg=0 guibg=lightgrey')
vim.cmd('highlight SignColumn guibg=#282828')

