local r = require("lt.utils.remaps")
local builtin = require("telescope.builtin")
local functions = require("lt.plugins.telescope.functions")

r.noremap("n", "<leader>pp", "<cmd>Telescope projects<CR>", "telescope_projects", "Projects")
r.noremap("n", "<leader>ps", builtin.live_grep, "telescope_live_grep", "Live grep")
r.noremap("n", "<leader>pS", functions.live_grep_in_folder, "telescope_live_grep_in_folder", "Live grep in folder")
r.noremap("n", "<leader>pf", builtin.find_files, "telescope_files", "Find files")
r.noremap("n", "<leader>po", builtin.oldfiles, "telescope_old_files", "Find files")
r.noremap("n", "<leader>pg", builtin.git_files, "telescope_git_files", "Find git files")
r.noremap("n", "<leader>cc", functions.search_config, "telescope_search_config", "Search neovim config")
r.noremap("n", "<leader>/h", builtin.highlights, "telescope_highlights", "Search highlights")
r.noremap("n", "<leader>/C", builtin.command_history, "telescope_command_history", "Search command history")
r.noremap("n", "<leader>/c", builtin.commands, "telescope_commands", "Search commands")
r.noremap("n", "<leader>/r", builtin.registers, "telescope_registers", "Search registers")
r.noremap("n", "<leader>/m", builtin.marks, "telescope_marks", "Search marks")
r.noremap("n", "<leader>/t", builtin.treesitter, "telescope_treesitter", "Search treesitter")
r.noremap("n", "<leader>/gb", builtin.git_branches, "telescope_git_branches", "Search git branches")
r.noremap("n", "<leader>/gc", builtin.git_commits, "telescope_git_commits", "Search git commits")
r.noremap("n", "<leader>bl", builtin.buffers, "telescope_buffers", "Search buffers")
r.noremap("n", "<leader>bc", builtin.git_bcommits, "telescope_git_bcommits", "Search buffer git commits")
