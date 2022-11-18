local present, ssr = pcall(require, "ssr")

if not present then
  vim.notify("ssr not present")
  return
end

ssr.setup()

local r = require("lt.utils.remaps")

r.noremap({ "n", "x" }, "<leader>sr", function()
  ssr.open()
end, "Structural search and replace")
