local M = {}

M.organize_imports_sync = function(timeout_ms)
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

return M
