nnoremap('<leader>ps', "<cmd>lua require('telescope.builtin').live_grep()<CR>", 'telescope', 'telescope_live_grep', 'Live grep')
nnoremap('<leader>pF', "<cmd>lua require('telescope.builtin').find_files()<CR>", 'telescope', 'telescope_files', 'Find files')
nnoremap('<leader>pG', "<cmd>lua require('telescope.builtin').git_files()<CR>", 'telescope', 'telescope_git_files', 'Find git files')
nnoremap('<leader>cc', "<cmd>lua require('lt.plugins.telescope.functions').search_config()<CR>", 'telescope', 'telescope_search_config', 'Search neovim config')

nnoremap('<leader>/h', "<cmd>lua require('telescope.builtin').command_history()<CR>", 'telescope', 'telescope_command_history', 'Search command history')
nnoremap('<leader>/c', "<cmd>lua require('telescope.builtin').commands()<CR>", 'telescope', 'telescope_commands', 'Search commands')
nnoremap('<leader>/r', "<cmd>lua require('telescope.builtin').registers()<CR>", 'telescope', 'telescope_registers', 'Search registers')
nnoremap('<leader>/m', "<cmd>lua require('telescope.builtin').marks()<CR>", 'telescope', 'telescope_marks', 'Search marks')
nnoremap('<leader>/t', "<cmd>lua require('telescope.builtin').treesitter()<CR>", 'telescope', 'telescope_treesitter', 'Search treesitter')

nnoremap('<leader>bL', "<cmd>lua require('telescope.builtin').buffers()<CR>", 'telescope', 'telescope_buffers', 'Search buffers')
