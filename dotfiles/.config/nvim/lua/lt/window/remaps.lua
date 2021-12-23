local r = require("lt.utils.remaps")
-- Use s instead of <C-w> to handle windows
-- nnoremap('s', '<C-w>', 'remap', 'remap_s', 'Remaps s to handle windows')

r.nnoremap("<leader>wh", "<cmd>wincmd h<CR>", "window", "window_move_left", "Move window left")
r.nnoremap("<leader>wj", "<cmd>wincmd j<CR>", "window", "window_move_down", "Move window down")
r.nnoremap("<leader>wk", "<cmd>wincmd k<CR>", "window", "window_move_up", "Move window up")
r.nnoremap("<leader>wl", "<cmd>wincmd l<CR>", "window", "window_move_right", "Move window right")
r.nnoremap("<leader>w+", "<cmd>vertical resize +5<CR>", "window", "window_increase_size", "Increase window size")
r.nnoremap("<leader>w-", "<cmd>vertical resize -5<CR>", "window", "window_decrease_size", "Decrease window size")
