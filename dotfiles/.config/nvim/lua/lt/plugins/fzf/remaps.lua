-- to include unstaged files
nnoremap('<leader>pG', '<cmd>GFiles --cached --others --exclude-standard<CR>', 'fzf', 'fzf_git_files', 'Show all git files')
nnoremap('<leader>pF', '<cmd>Files<CR>', 'fzf', 'fzf_files', 'Show all files')
nnoremap('<leader>bL', '<cmd>Buffers<CR>', 'fzf', 'fzf_buffers', 'Show buffers')
