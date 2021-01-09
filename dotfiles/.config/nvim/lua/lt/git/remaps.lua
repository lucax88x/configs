-- FuGITive
nmap('<leader>gs', '<cmd>G<CR>')
nmap('<leader>gf', '<cmd>diffget //2<CR>')
nmap('<leader>gj', '<cmd>diffget //3<CR>')
nmap('<leader>gd', '<cmd>Gdiffsplit<CR>')
nmap('<leader>gc', '<cmd>GCheckout<CR>')
nmap('<leader>gs', '<cmd>BCommits!<CR>')

-- -- vim-gitgutter
-- nmap(']h', '<Plug>(GitGutterNextHunk)')
-- nmap('[h', '<Plug>(GitGutterPrevHunk)')
-- nmap('ghs', '<Plug>(GitGutterStageHunk)')
-- nmap('ghu', '<Plug>(GitGutterUndoHunk)')
-- nmap('ghp', '<Plug>(GitGutterPreviewHunk)')

nnoremap(']h', "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'")
nnoremap('[h',  "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'")

nnoremap('<LEADER>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>')
nnoremap('<LEADER>hu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>')
nnoremap('<LEADER>hr', '<cmd>lua require"gitsigns".reset_hunk()<CR>')
nnoremap('<LEADER>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>')
nnoremap('<LEADER>hb', '<cmd>lua require"gitsigns".blame_line()<CR>')
