local present, diffview = pcall(require, "diffview")

if not present then
	return
end

local r = require("lt.utils.remaps")

r.which_key("<leader>gd", "diffview")

r.noremap("n", "<leader>gdo", "<cmd>DiffviewOpen<CR>", "diffview_open", "Open diffview")
r.noremap("n", "<leader>gdc", "<cmd>DiffviewClose<CR>", "diffview_close", "Close diffview")
r.noremap("n", "<leader>gdr", "<cmd>DiffviewRefresh<CR>", "diffview_refresh", "Refresh diffview")
r.noremap("n", "<leader>gdt", "<cmd>DiffviewToggleFiles<CR>", "diffview_toggle_files", "Toggle files in diffview")

diffview.setup({})
