local vim = vim
local present, lsp_lines = pcall(require, "lsp_lines")

if not present then
  vim.notify("Could not load lsp_lines")
  return
end

local r = require("lt.utils.remaps")

lsp_lines.setup()

r.map("n", "<leader>le", function()
  local current_value = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({
    virtual_text = not current_value,
    virtual_lines = current_value,
  })
  return current_value
end, "Toggle lsp_lines")
