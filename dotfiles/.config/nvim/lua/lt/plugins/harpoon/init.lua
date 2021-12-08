local present, harpoon = pcall(require, 'harpoon')

if not (present) then
	return
end

harpoon.setup({})

nnoremap('<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>', 'harpoon', 'harpoon_add_file', 'Adds file to harpoon')
nnoremap('<leader>hl', '<cmd>Telescope harpoon marks<CR>', 'harpoon', 'harpoon_toggle_quick_menu', 'Toggles harpoon quick menu')
nnoremap('<leader>h1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', 'harpoon', 'harpoon_nav_file_1', 'Nav to harpoon 1')
nnoremap('<leader>h2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', 'harpoon', 'harpoon_nav_file_2', 'Nav to harpoon 2')
nnoremap('<leader>h3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', 'harpoon', 'harpoon_nav_file_3', 'Nav to harpoon 3')
nnoremap('<leader>h4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', 'harpoon', 'harpoon_nav_file_4', 'Nav to harpoon 4')
