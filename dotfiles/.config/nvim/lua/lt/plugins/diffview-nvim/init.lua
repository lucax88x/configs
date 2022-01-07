local present, diffview = pcall(require, "diffview")

if not present then
	return
end

local r = require("lt.utils.remaps")

r.whick_key("<leader>gd", "diffview")

r.nnoremap("<leader>gdo", "<cmd>DiffviewOpen<CR>", "diffview", "diffview_open", "Open diffview")
r.nnoremap("<leader>gdc", "<cmd>DiffviewClose<CR>", "diffview", "diffview_close", "Close diffview")
r.nnoremap("<leader>gdr", "<cmd>DiffviewRefresh<CR>", "diffview", "diffview_refresh", "Refresh diffview")
r.nnoremap("<leader>gdt", "<cmd>DiffviewToggleFiles<CR>", "diffview", "diffview_toggle_files", "Toggle files in diffview")

diffview.setup({})
