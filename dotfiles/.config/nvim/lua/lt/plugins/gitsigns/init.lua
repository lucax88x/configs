local present, gitsigns = pcall(require, "gitsigns")

if not present then
	return
end

gitsigns.setup({
	signs = {
		add = { hl = "GruvboxGreen", text = "│", numhl = "GitSignsAddNr" },
		change = { hl = "GruvboxAqua", text = "│", numhl = "GitSignsChangeNr" },
		delete = { hl = "GruvboxRed", text = "_", numhl = "GitSignsDeleteNr" },
		topdelete = { hl = "GruvboxRed", text = "‾", numhl = "GitSignsDeleteNr" },
		changedelete = { hl = "GruvboxAqua", text = "~", numhl = "GitSignsChangeNr" },
	},
	numhl = false,
	watch_gitdir = {
		interval = 1000,
	},
	sign_priority = 9,
	status_formatter = nil, -- Use default
})

local r = require("lt.utils.remaps")

r.nnoremap(
	"]h",
	"&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'",
	"git",
	"git_next_hunk",
	"Go to next hunk"
)
r.nnoremap(
	"[h",
	"&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'",
	"git",
	"git_prev_hunk",
	"Go to prev hunk"
)

r.nnoremap("<leader>ghs", '<cmd>lua require"gitsigns".stage_hunk()<CR>', "git", "git_stage_hunk", "Stage hunk")

r.nnoremap(
	"<leader>ghu",
	'<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
	"git",
	"git_undo_stage_hunk",
	"Undo stage hunk"
)

r.nnoremap("<leader>ghr", '<cmd>lua require"gitsigns".reset_hunk()<CR>', "git", "git_reset_hunk", "Reset hunk")
r.nnoremap("<leader>ghp", '<cmd>lua require"gitsigns".preview_hunk()<CR>', "git", "git_preview_hunk", "Preview hunk")
r.nnoremap("<leader>ghb", '<cmd>lua require"gitsigns".blame_line()<CR>', "git", "git_blame_line", "Blame line")
