local vim = vim
local present, lsp_lines = pcall(require, "lsp_lines")

if not present then
  vim.notify("Could not load lsp_lines")
  return
end

lsp_lines.setup()
