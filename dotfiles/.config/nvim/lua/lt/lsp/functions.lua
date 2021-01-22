local lsp = vim.lsp
local functions = require('lt.utils.functions')

local M = {}

function M.organize_imports_sync2()
  local params = lsp.util.make_range_params()
  params.context = {
    diagnostics = {},
    only = { 'source.organizeImports' }
  }

  local responses = lsp.buf_request_sync(0, 'textDocument/codeAction', params)

  functions.tprint(responses)

  if not responses or vim.tbl_isempty(responses) then
    print('You cannot organize your imports')
    return
  end

  for _, response in pairs(responses) do
    for _, result in pairs(response.result or {}) do
      if result.edit then
        lsp.util.apply_workspace_edit(result.edit)
      end
    end
  end
end

function M.organize_imports_sync()
  -- local params = lsp.util.make_range_params()
  -- functions.tprint(lsp.util.make_workspace_params())
  -- functions.tprint(params)
  local params = {
    -- diagnostics = {},
    -- only = { '_typescript.organizeImports' }
    command = '_typescript.organizeImports',
    arguments = {}
  }

  params.arguments[0] = 'file:///home/lucatrazzi/repos/playfeedback/src/playfeedback.app/pages/index.tsx'

  functions.tprint(params)

  local responses = lsp.buf_request_sync(0, 'workspace/executeCommand', params)

  functions.tprint(responses)

  if not responses or vim.tbl_isempty(responses) then
    print('You cannot organize your imports')
    return
  end

  for _, response in pairs(responses) do
    for _, result in pairs(response.result or {}) do
      if result.edit then
        lsp.util.apply_workspace_edit(result.edit)
      end
    end
  end
end

return M
