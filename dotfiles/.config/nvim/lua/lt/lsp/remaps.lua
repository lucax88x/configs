local custom = {}
custom.organize_imports_sync = function(timeout_ms)
  print('test')
  -- local context = { source = { organizeImports = true } }
  -- vim.validate { context = { context, 't', true } }
  -- local params = vim.lsp.util.make_range_params()
  -- params.context = context

  -- local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  -- if not result then return end
  -- result = result[1].result
  -- if not result then return end
  -- edit = result[1].edit
  -- vim.lsp.util.apply_workspace_edit(edit)
end

-- function Lint()	
--   silent :CocCommand eslint.executeAutofix	
-- endfunction

nnoremap('<leader>td', '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('<leader>tt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nnoremap('<leader>ti', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nnoremap('<leader>tr', '<cmd>lua vim.lsp.buf.references()<CR>')
nnoremap('<leader>th', '<cmd>lua vim.lsp.buf.hover()<CR>')
	-- map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
nnoremap('<leader>to', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

nnoremap('<leader>fa', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- nnoremap('<leader>fe', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
nnoremap('<leader>fe', '<cmd>:LspDiagnostics 0<CR>')

nnoremap('<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>')
nnoremap('<leader>fo', '<cmd>lua custom.organize_import_sync()<CR>')

nnoremap('<leader>rr','<cmd>lua vim.lsp.buf.rename()<CR>')

-- using tab for navigating in completion
vim.api.nvim_exec(
[[
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <Tab> <Plug>(completion_smart_tab) 
imap <S-Tab> <Plug>(completion_smart_s_tab) 
]],
true)


	-- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	-- map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	-- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	-- map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	-- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	-- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	-- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	-- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  --

