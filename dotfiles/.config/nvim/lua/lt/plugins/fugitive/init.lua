local r = require("lt.utils.remaps")

r.map("n", "<leader>gs", "<cmd>G<CR>", "git status")
r.map("n", "<leader>gf", "<cmd>diffget //2<CR>", "diffget 2")
r.map("n", "<leader>gj", "<cmd>diffget //3<CR>", "diffget 3")
r.map("n", "<leader>gD", "<cmd>Gdiffsplit<CR>", "shows diff with git")
r.map("n", "<leader>gb", "<cmd>Git blame<CR>", "blame")
r.map("n", "<leader>gt", "<cmd>0Gclog!<CR>", "Navigate history")

r.which_key("<leader>gm", "merge conflicts")
r.map("n", "<leader>gmo", "<cmd>Gvdiffsplit!<CR>", "shows merge conflicts with git")
r.map("n", "<leader>gml", "<cmd>Git mergetool<CR>", "load merge conflicts in quickfix list")
