local r = require("lt.utils.remaps")

r.noremap("n", "<leader>bd", "<cmd>bd<CR>", "buffer_delete", "Deletes buffer")
r.noremap("n", "<leader>bD", "<cmd>bd!<CR>", "buffer_delete_force", "Force delete buffer")
r.noremap("n", "<leader>bo", "<cmd>BufOnly<CR>", "buffer_delete_others", "Deletes all other buffers except yours")
r.noremap("n", "<leader>bad", "<cmd>%bd<CR>", "buffer_delete_all", "Deletes all buffers")
r.noremap("n", "<leader>bw", "<cmd>update<CR>", "buffer_update", "Saves/writes/updates buffer")
r.noremap("n", "<leader>bW", "<cmd>update!<CR>", "buffer_update_force", "Force save/write/update buffer")
