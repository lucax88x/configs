nnoremap('<leader>ps', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap('<leader>pF', "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap('<leader>pG', "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap('<leader>cc', "<cmd>lua require('lt.plugins.telescope.functions').search_config()<CR>")

nnoremap('<leader>/h', "<cmd>lua require('telescope.builtin').command_history()<CR>")
nnoremap('<leader>/c', "<cmd>lua require('telescope.builtin').commands()<CR>")
nnoremap('<leader>/r', "<cmd>lua require('telescope.builtin').registers()<CR>")
nnoremap('<leader>/m', "<cmd>lua require('telescope.builtin').marks()<CR>")
nnoremap('<leader>/t', "<cmd>lua require('telescope.builtin').treesitter()<CR>")

nnoremap('<leader>bL', "<cmd>lua require('telescope.builtin').buffers()<CR>")
