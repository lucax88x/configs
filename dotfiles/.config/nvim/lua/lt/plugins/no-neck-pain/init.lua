return {
  "shortcuts/no-neck-pain.nvim",
  cmd = "NoNeckPain",
  init = function()
    local r = require("lt.utils.remaps")

    r.map("n", "<leader>zp", function()
      vim.cmd("NoNeckPain")
    end, "no neck pain")
  end,
}
