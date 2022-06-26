--[[ vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = "" ]]

local r = require("lt.utils.remaps")

vim.g.copilot_filetypes = {
  TelescopePrompt = false,
}

vim.g.copilot_no_tab_map = true

r.map("i", "<C-a>", "copilot#Accept()", "Accepts copilot suggestion", { script = true, expr = true, silent = true })
r.map("i", "<C-x>", "copilot#Dismiss()", "Dismisses copilot suggestion", { script = true, expr = true, silent = true })
