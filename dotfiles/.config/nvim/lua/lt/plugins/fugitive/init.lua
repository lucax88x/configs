local r = require("lt.utils.remaps")

r.map("n", "<leader>gs", "<cmd>G<CR>", "git_status", "git status")
r.map("n", "<leader>gf", "<cmd>diffget //2<CR>", "git_diffget_2", "diffget 2")
r.map("n", "<leader>gj", "<cmd>diffget //3<CR>", "git_diffget_3", "diffget 3")
r.map("n", "<leader>gD", "<cmd>Gdiffsplit<CR>", "git_diff_split", "shows diff with git")
r.map("n", "<leader>gb", "<cmd>Git blame<CR>", "git_blame", "blame")
r.map("n", "<leader>gt", "<cmd>0Gclog!<CR>", "git_navigate_history", "Navigate history")

r.which_key("<leader>gm", "merge conflicts")
r.map("n", "<leader>gmo", "<cmd>Gvdiffsplit!<CR>", "git_merge_split", "shows merge conflicts with git")
r.map("n", "<leader>gml", "<cmd>Git mergetool<CR>", "git_load_merge_conflicts", "load merge conflicts in quickfix list")
