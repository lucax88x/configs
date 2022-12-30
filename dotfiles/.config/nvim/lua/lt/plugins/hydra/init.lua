return {
  "anuvyklack/hydra.nvim",
  config = function()
    require("lt.plugins.hydra.git")
    require("lt.plugins.hydra.windows")
  end,
  event = "VeryLazy",
}
