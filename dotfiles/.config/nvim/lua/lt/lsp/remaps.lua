local functions = require  'lt.utils.functions'

local M = {}

function M.set(cap, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  -- functions.tprint(cap)
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  if cap.definitionProvider then
    buf_set_keymap('n','<leader>td', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n','<leader>tt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  end
  -- if cap.declarationProvider then
  -- map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- end
  if cap.implementationProvider then
    buf_set_keymap('n','<leader>ti', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  end
  if cap.referencesProvider then
    buf_set_keymap('n','<leader>tr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  end

  buf_set_keymap('n','<leader>th', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  if cap.documentSymbolProvider then
    buf_set_keymap('n','<leader>to', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  end

  -- if cap.workspaceSymbolProvider then
  --   map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- end

  if cap.codeActionProvider then
    buf_set_keymap('n','<leader>fa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('v', '<leader>fa', "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<cr>", opts)
    buf_set_keymap('n','<leader>fo', '<cmd>lua require("lt.lsp.functions").organize_imports()<CR>', opts)
  end

  -- buf_set_keymap('n','<leader>fe', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n','<leader>fe', '<cmd>:LspDiagnostics 0<CR>', opts)
  buf_set_keymap('n','<leader>fE', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n','[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n',']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  if cap.documentFormattingProvider then
    buf_set_keymap('n','<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  elseif cap.documentRangeFormattingProvider then
    buf_set_keymap('n','<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  if cap.renameProvider then
    buf_set_keymap('n','<leader>rr','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  end

  buf_set_keymap('n','<leader>fcd', ':lua print(vim.inspect(vim.lsp.get_active_clients()))<CR>', opts)
  buf_set_keymap('n','<leader>fcl', ":lua print(vim.lsp.get_log_path())<CR>", opts)
  -- buf_set_keymap('n','<leader>fcl', ":lua vim.cmd('e'..vim.lsp.get_log_path())<CR>", opts)
  buf_set_keymap('n','<leader>fci', ':LspInfo()<CR>', opts)

  imap('<c-p>', '<Plug>(completion_trigger)')
  imap('<Tab>', '<Plug>(completion_smart_tab)')
  imap('<S-Tab>', '<Plug>(completion_smart_s_tab)')
  imap('<c-j>', '<Plug>(completion_next_source)') --use <c-j> to switch to previous completion
  imap('<c-k>', '<Plug>(completion_prev_source)') --use <c-k> to switch to next completion

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
