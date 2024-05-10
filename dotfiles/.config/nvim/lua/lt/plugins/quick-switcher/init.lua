-- TODO: consider switching to hydra

return {
  "Everduin94/nvim-quick-switcher",
  keys = {
    {
      "<leader>Qh",
      function()
        local quick_switcher = require("nvim-quick-switcher")
        quick_switcher.toggle("component.ts", "component.html")
      end,
      desc = "component.ts <-> component.html",
    },
    {
      "<leader>Qs",
      function()
        local quick_switcher = require("nvim-quick-switcher")
        quick_switcher.toggle("ts", "scss")
      end,
      desc = "component.ts <-> component.scss",
    },
    {
      "<leader>Qt",
      function()
        require("nvim-quick-switcher").find(".+test|.+spec", { regex = true, prefix = "full" })
      end,
      desc = "spec <-> code",
    },
  },
}
