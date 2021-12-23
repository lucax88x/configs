vim.g.ctrlsf_auto_focus = {
	at = "start",
}

local r = require("lt.utils.remaps")

r.nmap("<leader>pr", "<Plug>CtrlSFPrompt", "search", "search_all_files", "Search term in all files")

r.nnoremap("<leader>pR", ":CtrlSFToggle<CR>", "search", "search_all_files_toggle", "Toggle searched term in all files")

r.inoremap(
	"<leader>pR",
	"<Esc>:CtrlSFToggle<CR>",
	"search",
	"search_all_files_toggle_in_insert",
	"Toggle searched term in all files (in insert mode)"
)
