local vim = vim
local present, ufo = pcall(require, "ufo")

if not present then
  return
end

vim.keymap.set("n", "zR", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)
