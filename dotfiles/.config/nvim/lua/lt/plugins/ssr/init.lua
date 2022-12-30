return {
  "cshuaimin/ssr.nvim",
  config = function()
    local ssr = require("ssr")

    ssr.setup()
  end,
  init = function()
    local r = require("lt.utils.remaps")

    r.noremap({ "n", "x" }, "<leader>sr", function()
      require("ssr").open()
    end, "Structural search and replace")
  end,
  keys = "<leader>sr",
}
