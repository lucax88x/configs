local r = require("lt.utils.remaps")

r.noremap("n", "<leader>pp", "<cmd>Telescope projects<CR>", "telescope_projects", "Projects")

r.noremap("n", "ps", "<cmd>lua require('telescope.builtin').live_grep()<CR>", "telescope_live_grep", "Live grep")

r.noremap("n", "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<CR>", "telescope_files", "Find files")

r.noremap(
	"n",
	"<leader>po",
	"<cmd>lua require('telescope.builtin').oldfiles()<CR>",
	"telescope_old_files",
	"Find files"
)

r.noremap(
	"n",
	"<leader>pg",
	"<cmd>lua require('telescope.builtin').git_files()<CR>",
	"telescope_git_files",
	"Find git files"
)

r.noremap(
	"n",
	"<leader>cc",
	"<cmd>lua require('lt.plugins.telescope.functions').search_config()<CR>",
	"telescope_search_config",
	"Search neovim config"
)

r.noremap(
	"n",
	"<leader>/h",
	"<cmd>lua require('telescope.builtin').highlights()<CR>",
	"telescope_highlights",
	"Search highlights"
)

r.noremap(
	"n",
	"<leader>/C",
	"<cmd>lua require('telescope.builtin').command_history()<CR>",
	"telescope_command_history",
	"Search command history"
)

r.noremap(
	"n",
	"<leader>/c",
	"<cmd>lua require('telescope.builtin').commands()<CR>",
	"telescope_commands",
	"Search commands"
)

r.noremap(
	"n",
	"<leader>/r",
	"<cmd>lua require('telescope.builtin').registers()<CR>",
	"telescope_registers",
	"Search registers"
)

r.noremap("n", "<leader>/m", "<cmd>lua require('telescope.builtin').marks()<CR>", "telescope_marks", "Search marks")

r.noremap(
	"n",
	"<leader>/t",
	"<cmd>lua require('telescope.builtin').treesitter()<CR>",
	"telescope_treesitter",
	"Search treesitter"
)

r.noremap(
	"n",
	"<leader>/gb",
	"<cmd>lua require('telescope.builtin').git_branches()<CR>",
	"telescope_git_branches",
	"Search git branches"
)

r.noremap(
	"n",
	"<leader>/gc",
	"<cmd>lua require('telescope.builtin').git_commits()<CR>",
	"telescope_git_commits",
	"Search git commits"
)

r.noremap(
	"n",
	"<leader>bl",
	"<cmd>lua require('telescope.builtin').buffers()<CR>",
	"telescope_buffers",
	"Search buffers"
)

r.noremap(
	"n",
	"<leader>bc",
	"<cmd>lua require('telescope.builtin').git_bcommits()<CR>",
	"telescope_git_bcommits",
	"Search buffer git commits"
)

r.noremap("n", "<leader>/M", "<cmd>Telescope mapper<CR>", "telescope_mapper", "Search mappings")
