nnoremap(']h', "&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'", 'git', 'git_next_hunk', 'Go to next hunk')
nnoremap('[h',  "&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'", 'git', 'git_prev_hunk', 'Go to prev hunk')

nnoremap('<leader>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', 'git', 'git_stage_hunk', 'Stage hunk')
nnoremap('<leader>hu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'git', 'git_undo_stage_hunk', 'Undo stage hunk')
nnoremap('<leader>hr', '<cmd>lua require"gitsigns".reset_hunk()<CR>', 'git', 'git_reset_hunk', 'Reset hunk')
nnoremap('<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', 'git', 'git_preview_hunk', 'Preview hunk')
nnoremap('<leader>hb', '<cmd>lua require"gitsigns".blame_line()<CR>', 'git', 'git_blame_line', 'Blame line')
