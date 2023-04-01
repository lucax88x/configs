-- TODO: consider switching to hydra

return {
  "Everduin94/nvim-quick-switcher",
  keys = {
    {
      "<leader>qh",
      function()
        local quick_switcher = require("nvim-quick-switcher")
        quick_switcher.toggle("component.ts", "component.html")
      end,
      desc = "component.ts <-> component.html"
    },
    {
      "<leader>qs",
      function()
        local quick_switcher = require("nvim-quick-switcher")
        quick_switcher.toggle("ts", "scss")
      end,
      desc = "component.ts <-> component.scss"
    },
    {
      "<leader>qt",
      function()
        local quick_switcher = require("nvim-quick-switcher")
        quick_switcher.toggle("spec.ts", "ts")
      end,
      desc = "spec <-> code" }
  },
}
