local r = require("lt.utils.remaps")

r.nmap("<leader>gs", "<cmd>G<CR>", "git", "git_status", "Git status")
r.nmap("<leader>gf", "<cmd>diffget //2<CR>", "git", "git_diffget_2", "TODO diffget 2")
r.nmap("<leader>gj", "<cmd>diffget //3<CR>", "git", "git_diffget_3", "TODO diffget 3")
r.nmap("<leader>gd", "<cmd>Gdiffsplit<CR>", "git", "git_diff_split", "Shows diff with git")
r.nmap("<leader>gb", "<cmd>Git blame<CR>", "git", "git_blame", "Blame")
-- r.nmap("<leader>gh", "<cmd>0Gclog!<CR>", "git", "git_navigate_history", "Navigate history")
