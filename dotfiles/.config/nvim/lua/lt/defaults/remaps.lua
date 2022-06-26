local r = require("lt.utils.remaps")
local functions = require("lt.utils.functions")

-- quit
r.noremap("n", "Q", "<cmd>q<CR>", "Quits editor")
r.noremap("n", "<leader>Q", "<cmd>q!<CR>", "Force quits editor")

-- reload
r.noremap("n", "<leader><CR>", functions.reload, "Reloads configuration")

-- undo
r.noremap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", "Toggle undo history")

-- move upper/down on visual
r.noremap("v", "K", '<cmd>m "<-2<CR>gv=gv"', "Move upper on visual")
r.noremap("v", "J", '<cmd>m ">+1<CR>gv=gv"', "Move down on visual")

-- deletes in visual
r.noremap("v", "X", '"_d', "Deletes on visual")

-- when going to next search, we center screen
r.noremap("n", "n", "nzzzv", "When going to next search, we center screen")
r.noremap("n", "N", "Nzzzv", "When going to previous search, we center screen")

-- navigate quick fix
r.noremap("n", "]q", ":cnext<CR>", "Navigate to next quickfix")
r.noremap("n", "[q", ":cprev<CR>", "Navigate to previous quickfix")

-- maps c-n / c-t to navigate while searching with /
vim.api.nvim_exec(
	[[
cnoremap <expr> <c-n> getcmdtype() =~ '[\/?]' ? '<c-g>' : '<c-n>'
cnoremap <expr> <c-p> getcmdtype() =~ '[\/?]' ? '<c-t>' : '<c-p>'
]],
	false
)
