local present, quick_switcher = pcall(require, "nvim-quick-switcher")

if not present then
  return
end

local r = require("lt.utils.remaps")

-- TODO: consider switching to hydra

r.which_key("<leader>q", "quick-switcher")

r.noremap("n", "<leader>qh", function()
  quick_switcher.toggle("component.ts", "component.html")
end, "component.ts <-> component.html")

-- r.noremap("n", "<leader>qs", function()
-- 	quick_switcher.switch("scss")
-- end, "quick_switcher", "Switch to scss")

r.noremap("n", "<leader>qt", function()
  quick_switcher.toggle("spec.ts", "ts")
end, "spec <-> code")
