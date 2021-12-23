local r = require('lt.utils.remaps');

r.nnoremap("<leader>bd", "<cmd>bd<CR>", "buffer", "buffer_delete", "Deletes buffer")
r.nnoremap("<leader>bD", "<cmd>bd!<CR>", "buffer", "buffer_delete_force", "Force delete buffer")
r.nnoremap("<leader>bo", "<cmd>BufOnly<CR>", "buffer", "buffer_delete_others", "Deletes all other buffers except yours")
r.nnoremap("<leader>bad", "<cmd>%bd<CR>", "buffer", "buffer_delete_all", "Deletes all buffers")
r.nnoremap("<leader>bw", "<cmd>update<CR>", "buffer", "buffer_update", "Saves/writes/updates buffer")
r.nnoremap("<leader>bW", "<cmd>update!<CR>", "buffer", "buffer_update_force", "Force save/write/update buffer")
