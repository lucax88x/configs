local present, harpoon = pcall(require, "harpoon")

if not present then
	return
end

local r = require("lt.utils.remaps")

harpoon.setup({})

r.noremap("n", "<leader>ha", function()
	require("harpoon.mark").add_file()
end, "harpoon_add_file", "Adds file to harpoon")

r.noremap(
	"n",
	"<leader>hl",
	"<cmd>Telescope harpoon marks<CR>",
	"harpoon_toggle_quick_menu",
	"Toggles harpoon quick menu"
)

r.noremap("n", "<leader>h1", function()
	require("harpoon.ui").nav_file(1)
end, "harpoon_nav_file_1", "Nav to harpoon 1")

r.noremap("n", "<leader>h2", function()
	require("harpoon.ui").nav_file(2)
end, "harpoon_nav_file_2", "Nav to harpoon 2")

r.noremap("n", "<leader>h3", function()
	require("harpoon.ui").nav_file(3)
end, "Nav to harpoon 3")

r.noremap("n", "<leader>h4", function()
	require("harpoon.ui").nav_file(4)
end, "harpoon_nav_file_4", "Nav to harpoon 4")
