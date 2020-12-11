-- " Trigger completion with <Tab>
-- inoremap <silent><expr> <TAB>
--   \ pumvisible() ? "\<C-n>" :
--   \ <SID>check_back_space() ? "\<TAB>" :
--   \ completion#trigger_completion()

-- function! s:check_back_space() abort
--     let col = col('.') - 1
--     return !col || getline('.')[col - 1]  =~ '\s'
-- endfunction

nnoremap('<leader>td', '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('<leader>tt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nnoremap('<leader>ti', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- nnoremap('<leader>tr', '<cmd>lua vim.lsp.buf.references()<CR>')
nnoremap('<leader>tr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>')
nnoremap('<leader>th', '<cmd>lua vim.lsp.buf.hover()<CR>')
	-- map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
nnoremap('<leader>to', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- nnoremap('<leader>fa', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- nnoremap('<leader>fa', '<cmd>CodeActions()<CR>')
nnoremap('<leader>fa', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>')
-- nnoremap('<leader>fe', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
nnoremap('<leader>fe', '<cmd>lua require("telescope.functions").show_diagnostics()<CR>')

nnoremap('<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>')

nnoremap('<leader>rr','<cmd>lua vim.lsp.buf.rename()<CR>')



	-- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	-- map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	-- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	-- map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	-- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	-- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	-- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	-- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  --

-- Show diagnostic popup on cursor hold
vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })')
