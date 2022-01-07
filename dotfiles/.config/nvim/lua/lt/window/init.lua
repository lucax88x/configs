local r = require("lt.utils.remaps")
-- Use s instead of <C-w> to handle windows
-- nnoremap('s', '<C-w>', 'remap', 'remap_s', 'Remaps s to handle windows')

r.noremap("n", "<leader>wh", "<cmd>wincmd h<CR>", "window_move_left", "Move window left")
r.noremap("n", "<leader>wj", "<cmd>wincmd j<CR>", "window_move_down", "Move window down")
r.noremap("n", "<leader>wk", "<cmd>wincmd k<CR>", "window_move_up", "Move window up")
r.noremap("n", "<leader>wl", "<cmd>wincmd l<CR>", "window_move_right", "Move window right")
r.noremap("n", "<leader>w+", "<cmd>vertical resize +5<CR>", "window_increase_size", "Increase window size")
r.noremap("n", "<leader>w-", "<cmd>vertical resize -5<CR>", "window_decrease_size", "Decrease window size")
