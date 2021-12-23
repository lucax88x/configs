local present, harpoon = pcall(require, "harpoon")

if not present then
	return
end

local r = require("lt.utils.remaps")

harpoon.setup({})

r.nnoremap(
	"<leader>ha",
	'<cmd>lua require("harpoon.mark").add_file()<CR>',
	"harpoon",
	"harpoon_add_file",
	"Adds file to harpoon"
)

r.nnoremap(
	"<leader>hl",
	"<cmd>Telescope harpoon marks<CR>",
	"harpoon",
	"harpoon_toggle_quick_menu",
	"Toggles harpoon quick menu"
)

r.nnoremap(
	"<leader>h1",
	'<cmd>lua require("harpoon.ui").nav_file(1)<CR>',
	"harpoon",
	"harpoon_nav_file_1",
	"Nav to harpoon 1"
)

r.nnoremap(
	"<leader>h2",
	'<cmd>lua require("harpoon.ui").nav_file(2)<CR>',
	"harpoon",
	"harpoon_nav_file_2",
	"Nav to harpoon 2"
)

r.nnoremap(
	"<leader>h3",
	'<cmd>lua require("harpoon.ui").nav_file(3)<CR>',
	"harpoon",
	"harpoon_nav_file_3",
	"Nav to harpoon 3"
)

r.nnoremap(
	"<leader>h4",
	'<cmd>lua require("harpoon.ui").nav_file(4)<CR>',
	"harpoon",
	"harpoon_nav_file_4",
	"Nav to harpoon 4"
)
