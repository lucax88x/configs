local present, toggleterm = pcall(require, "toggleterm")

if not present then
  vim.notify("toggleterm not present")
  return
end

toggleterm.setup({})
