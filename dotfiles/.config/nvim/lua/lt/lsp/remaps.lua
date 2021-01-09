local M = {}

function M.set(cap)
  if cap.definitionProvider then
    nnoremap('<leader>td', '<cmd>lua vim.lsp.buf.definition()<CR>')
    nnoremap('<leader>tt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  end
  -- if cap.declarationProvider then
  -- map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  -- end
  if cap.implementationProvider then
    nnoremap('<leader>ti', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  end
  if cap.referencesProvider then
    nnoremap('<leader>tr', '<cmd>lua vim.lsp.buf.references()<CR>')
  end
  if cap.declarationProvider then
    nnoremap('<leader>th', '<cmd>lua vim.lsp.buf.hover()<CR>')
  end

  if cap.documentSymbolProvider then
    nnoremap('<leader>to', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  end
  -- if cap.workspaceSymbolProvider then
  --   map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  -- end


  if cap.codeActionProvider then
    nnoremap('<leader>fa', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    nnoremap('<leader>fo', '<cmd>lua require("lt.lsp.functions").organize_imports_sync()<CR>')
  end

  -- nnoremap('<leader>fe', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  nnoremap('<leader>fe', '<cmd>:LspDiagnostics 0<CR>')
  nnoremap('[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  nnoremap(']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

  if cap.documentFormattingProvider then
    nnoremap('<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  end

  if cap.renameProvider then
    nnoremap('<leader>rr','<cmd>lua vim.lsp.buf.rename()<CR>')
  end

  imap('<Tab>', '<Plug>(completion_smart_tab)')
  imap('<S-Tab>', '<Plug>(completion_smart_s_tab)')

  -- using tab for navigating in completion
  -- vim.api.nvim_exec(
  -- [[
  -- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  -- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  -- ]],
  -- true)


    -- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
    -- map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
    -- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
    -- map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
    -- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
    -- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
    -- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    -- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

return M
