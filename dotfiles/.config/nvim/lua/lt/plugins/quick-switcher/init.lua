-- TODO: consider switching to hydra

return {
  "Everduin94/nvim-quick-switcher",
  init = function()
    local r = require("lt.utils.remaps")

    r.noremap("n", "<leader>qh", function()
      local quick_switcher = require("nvim-quick-switcher")
      quick_switcher.toggle("component.ts", "component.html")
    end, "component.ts <-> component.html")

    -- r.noremap("n", "<leader>qs", function()
    -- 	quick_switcher.switch("scss")
    -- end, "quick_switcher", "Switch to scss")

    r.noremap("n", "<leader>qt", function()
      local quick_switcher = require("nvim-quick-switcher")
      quick_switcher.toggle("spec.ts", "ts")
    end, "spec <-> code")
  end,
  keys = { "<leader>qh", "<leader>qt" },
}
