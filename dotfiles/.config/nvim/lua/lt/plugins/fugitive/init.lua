local r = require("lt.utils.remaps")

r.map("n", "<leader>gs", "<cmd>G<CR>", "git_status", "Git status")
r.map("n", "<leader>gf", "<cmd>diffget //2<CR>", "git_diffget_2", "TODO diffget 2")
r.map("n", "<leader>gj", "<cmd>diffget //3<CR>", "git_diffget_3", "TODO diffget 3")
r.map("n", "<leader>gD", "<cmd>Gdiffsplit<CR>", "git_diff_split", "Shows diff with git")
r.map("n", "<leader>gb", "<cmd>Git blame<CR>", "git_blame", "Blame")
r.map("n", "<leader>gt", "<cmd>0Gclog!<CR>", "git_navigate_history", "Navigate history")
