local r = require("lt.utils.remaps")

r.nnoremap("<leader>pp", "<cmd>Telescope projects<CR>", "telescope", "telescope_projects", "Projects")

r.nnoremap(
	"<leader>ps",
	"<cmd>lua require('telescope.builtin').live_grep()<CR>",
	"telescope",
	"telescope_live_grep",
	"Live grep"
)

r.nnoremap(
	"<leader>pf",
	"<cmd>lua require('telescope.builtin').find_files()<CR>",
	"telescope",
	"telescope_files",
	"Find files"
)

r.nnoremap(
	"<leader>pg",
	"<cmd>lua require('telescope.builtin').git_files()<CR>",
	"telescope",
	"telescope_git_files",
	"Find git files"
)

r.nnoremap(
	"<leader>cc",
	"<cmd>lua require('lt.plugins.telescope.functions').search_config()<CR>",
	"telescope",
	"telescope_search_config",
	"Search neovim config"
)

r.nnoremap(
	"<leader>/h",
	"<cmd>lua require('telescope.builtin').command_history()<CR>",
	"telescope",
	"telescope_command_history",
	"Search command history"
)

r.nnoremap(
	"<leader>/c",
	"<cmd>lua require('telescope.builtin').commands()<CR>",
	"telescope",
	"telescope_commands",
	"Search commands"
)

r.nnoremap(
	"<leader>/r",
	"<cmd>lua require('telescope.builtin').registers()<CR>",
	"telescope",
	"telescope_registers",
	"Search registers"
)

r.nnoremap(
	"<leader>/m",
	"<cmd>lua require('telescope.builtin').marks()<CR>",
	"telescope",
	"telescope_marks",
	"Search marks"
)

r.nnoremap(
	"<leader>/t",
	"<cmd>lua require('telescope.builtin').treesitter()<CR>",
	"telescope",
	"telescope_treesitter",
	"Search treesitter"
)

r.nnoremap(
	"<leader>/gb",
	"<cmd>lua require('telescope.builtin').git_branches()<CR>",
	"telescope",
	"telescope_git_branches",
	"Search git branches"
)

r.nnoremap(
	"<leader>/gc",
	"<cmd>lua require('telescope.builtin').git_commits()<CR>",
	"telescope",
	"telescope_git_commits",
	"Search git commits"
)

r.nnoremap(
	"<leader>bl",
	"<cmd>lua require('telescope.builtin').buffers()<CR>",
	"telescope",
	"telescope_buffers",
	"Search buffers"
)

r.nnoremap(
	"<leader>bc",
	"<cmd>lua require('telescope.builtin').git_bcommits()<CR>",
	"telescope",
	"telescope_git_bcommits",
	"Search buffer git commits"
)
