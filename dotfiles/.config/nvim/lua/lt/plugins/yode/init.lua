local present, yode = pcall(require, "yode-nvim")

if not present then
	return
end

yode.setup({})

local r = require("lt.utils.remaps")

r.which_key("<leader>y", "yode")

r.map(
	"",
	"<leader>yc",
	":YodeCreateSeditorFloating<CR>",
	"yode_create_editor_floating",
	"Create floating Yode editor"
)
r.map(
	"",
	"<leader>yr",
	":YodeCreateSeditorReplace<CR>",
	"yode_create_editor_replace",
	"Create replace Yode editor"
)

-- vim.cmd("map <Leader>yc :YodeCreateSeditorFloating<CR>")
r.map("n", "<leader>yd", "<cmd>:YodeBufferDelete<CR>", "yode_buffer_delete", "Delete Yode buffer")
r.map("i", "<leader>yd", "<esc><cmd>:YodeBufferDelete<CR>", "yode_buffer_delete_from_insert", "Delete Yode buffer")

-- map <C-W>r :YodeLayoutShiftWinDown<CR>
-- map <C-W>R :YodeLayoutShiftWinUp<CR>
-- map <C-W>J :YodeLayoutShiftWinBottom<CR>
-- map <C-W>K :YodeLayoutShiftWinTop<CR>
