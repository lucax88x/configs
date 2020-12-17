-- FuGITive
nmap('<leader>gs', '<cmd>G<CR>')
nmap('<leader>gf', '<cmd>diffget //2<CR>')
nmap('<leader>gj', '<cmd>diffget //3<CR>')
nmap('<leader>gd', '<cmd>Gdiffsplit<CR>')
nmap('<leader>gc', '<cmd>GCheckout<CR>')
nmap('<leader>gs', '<cmd>BCommits!<CR>')

-- vim-gitgutter
nmap(']h', '<Plug>(GitGutterNextHunk)')
nmap('[h', '<Plug>(GitGutterPrevHunk)')
nmap('ghs', '<Plug>(GitGutterStageHunk)')
nmap('ghu', '<Plug>(GitGutterUndoHunk)')
nmap('ghp', '<Plug>(GitGutterPreviewHunk)')
