return {
  "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  filetype = { "markdown" },
  init = function()
    local r = require("lt.utils.remaps")

    r.which_key("<leader>m", "markdown")

    r.map("n", "<leader>mp", function()
      local peek = require("peek")

      if not peek.is_open then
        peek.open()
      else
        peek.close()
      end
    end, "toggle markdown preview")
  end,
  keys = "<leader>mp",
}
