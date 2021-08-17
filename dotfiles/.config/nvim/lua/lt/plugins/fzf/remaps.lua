-- to include unstaged files
nnoremap('<leader>pg', '<cmd>GFiles --cached --others --exclude-standard<CR>', 'fzf', 'fzf_git_files', 'Show all git files')
nnoremap('<leader>pf', '<cmd>Files<CR>', 'fzf', 'fzf_files', 'Show all files')

nnoremap('<leader>bl', '<cmd>Buffers<CR>', 'fzf', 'fzf_buffers', 'Show buffers')
