local r = require("lt.utils.remaps")

r.noremap("n", "<leader>bd", "<cmd>bd<CR>", "Deletes buffer")
r.noremap("n", "<leader>bD", "<cmd>bd!<CR>", "Force delete buffer")
r.noremap("n", "<leader>bo", "<cmd>BufOnly<CR>", "Deletes all other buffers except yours")
r.noremap("n", "<leader>bad", "<cmd>%bd<CR>", "Deletes all buffers")
r.noremap("n", "<leader>bw", "<cmd>update<CR>", "Saves/writes/updates buffer")
r.noremap("n", "<leader>bW", "<cmd>update!<CR>", "Force save/write/update buffer")
