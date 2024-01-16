return {
  "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  keys = {
    {
      "<leader>vm",
      function()
        local peek = require("peek")

        if not peek.is_open() then
          peek.open()
        else
          peek.close()
        end
      end,
      desc = "toggle markdown preview",
      mode = "n",
    },
  },
}
