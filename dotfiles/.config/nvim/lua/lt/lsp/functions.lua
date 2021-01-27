local lsp = vim.lsp
local functions = require('lt.utils.functions')

local M = {}

M.organize_imports = function()
  local params = lsp.util.make_range_params()
  params.context = {
    diagnostics = {},
    only = { 'source.organizeImports' }
  }

  local responses = lsp.buf_request_sync(0, 'textDocument/codeAction', params)

  if not responses or vim.tbl_isempty(responses) then
    return
  end

  for _, response in pairs(responses) do
    for _, result in pairs(response.result or {}) do
      if result.edit then
        lsp.util.apply_workspace_edit(result.edit)
      else
        lsp.buf.execute_command(result.command)
      end
    end
  end
end

return M
