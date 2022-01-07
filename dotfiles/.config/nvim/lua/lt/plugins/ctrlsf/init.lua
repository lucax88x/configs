vim.g.ctrlsf_auto_focus = {
	at = "start",
}

local r = require("lt.utils.remaps")

r.map("n", "<leader>pr", "<Plug>CtrlSFPrompt", "search_all_files", "Search term in all files")

r.noremap("n", "<leader>pR", ":CtrlSFToggle<CR>", "search_all_files_toggle", "Toggle searched term in all files")

r.noremap("i", "<leader>pR", "<Esc>:CtrlSFToggle<CR>", "search", "Toggle searched term in all files (in insert mode)")
