local r = require("lt.utils.remaps")
local functions = require("lt.utils.functions")

-- quit
r.noremap("n", "<leader>q", "<cmd>q<CR>", "quit", "Quits editor")
r.noremap("n", "Q", "<cmd>q!<CR>", "quit_force", "Force quits editor")

-- reload
r.noremap("n", "<leader><CR>", functions.reload, "reload", "Reloads configuration")

-- undo
r.noremap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", "undo", "Toggle undo history")

-- move upper/down on visual
r.noremap("v", "K", '<cmd>m "<-2<CR>gv=gv"', "remap_move_upper_on_visual", "Move upper on visual")
r.noremap("v", "J", '<cmd>m ">+1<CR>gv=gv"', "remap_move_down_on_visual", "Move down on visual")

-- deletes in visual
r.noremap("v", "X", '"_d', "remap_deletes_on_visual", "Deletes on visual")

-- when going to next search, we center screen
r.noremap("n", "n", "nzzzv", "remap_go_next_search", "When going to next search, we center screen")
r.noremap("n", "N", "Nzzzv", "remap_go_previous_serach", "When going to previous search, we center screen")

-- navigate quick fix
r.noremap("n", "]q", ":cnext<CR>", "remap_next_quickfix", "Navigate to next quickfix")
r.noremap("n", "[q", ":cprev<CR>", "remap_previous_quickfix", "Navigate to previous quickfix")

-- maps c-n / c-t to navigate while searching with /
vim.api.nvim_exec(
	[[
cnoremap <expr> <c-n> getcmdtype() =~ '[\/?]' ? '<c-g>' : '<c-n>'
cnoremap <expr> <c-p> getcmdtype() =~ '[\/?]' ? '<c-t>' : '<c-p>'
]],
	false
)
