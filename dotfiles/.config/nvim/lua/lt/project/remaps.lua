nnoremap('<leader>pv', '<cmd>wincmd v<bar> :Ex <bar> :vertical resize 30<CR>')

nnoremap('<leader>ps', '<cmd>Rg<SPACE><CR>')

-- set pwd to current file directory
nnoremap('<leader>pd', ':cd %:p:h<CR>')

nnoremap('<leader>pt', '<cmd>Rg<SPACE>TODO|FIXME<CR>')

-- to include unstaged files
nnoremap('<leader>pg', '<cmd>GFiles --cached --others --exclude-standard<CR>')
nnoremap('<leader>pf', '<cmd>Files<CR>')
