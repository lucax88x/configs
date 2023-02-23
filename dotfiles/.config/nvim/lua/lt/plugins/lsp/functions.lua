local M = {}
local vim = vim

M.show_diagnostics = function(opts)
  opts = opts or {}
  vim.diagnostic.setloclist({ open_loclist = false })
  require("telescope.builtin").loclist(opts)
end

return M
