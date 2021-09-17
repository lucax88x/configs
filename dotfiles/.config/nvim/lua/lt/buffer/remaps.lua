nnoremap('<leader>bd', '<cmd>bd<CR>', 'buffer', 'buffer_delete',
         'Deletes buffer')
nnoremap('<leader>bD', '<cmd>bd!<CR>', 'buffer', 'buffer_delete_force',
         'Force delete buffer')
nnoremap('<leader>bo', '<cmd>BufOnly<CR>', 'buffer', 'buffer_delete_others',
         'Deletes all other buffers except yours')
nnoremap('<leader>bad', '<cmd>%bd<CR>', 'buffer', 'buffer_delete_all',
         'Deletes all buffers')
nnoremap('<leader>bw', '<cmd>update<CR>', 'buffer', 'buffer_update',
         'Saves/writes/updates buffer')
nnoremap('<leader>bW', '<cmd>update!<CR>', 'buffer', 'buffer_update_force',
         'Force save/write/update buffer')
