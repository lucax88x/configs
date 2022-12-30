return {
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  init = function()
    local r = require("lt.utils.remaps")

    r.map("n", "<leader>le", function()
      local current_value = vim.diagnostic.config().virtual_text
      vim.diagnostic.config({
        virtual_text = not current_value,
        virtual_lines = current_value,
      })
      return current_value
    end, "Toggle lsp_lines")
  end,
  config = function()
    local lsp_lines = require("lsp_lines")

    lsp_lines.setup()
  end,
  keys = "<leader>le",
}
