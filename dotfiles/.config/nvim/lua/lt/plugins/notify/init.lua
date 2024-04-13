return {
  "rcarriga/nvim-notify",
  init = function()
    local r = require("lt.utils.remaps")

    r.noremap("n", "<leader>nc", function()
      local notify = require("notify")
      notify.dismiss()
    end, "Close all notifications")
  end,
  config = function()
    local notify = require("notify")

    notify.setup({
      stages = "fade",
      render = "compact",
      top_down = true,
      -- top_down = false,
    })

    vim.notify = notify
  end,
}
-- return {
--   "echasnovski/mini.notify",
--   config = function()
--     local win_config = function()
--       local has_statusline = vim.o.laststatus > 0
--       local bottom_space = vim.o.cmdheight + (has_statusline and 1 or 0)
--       return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - bottom_space }
--     end
--
--     require("mini.notify").setup({
--       window = { config = win_config },
--       -- done by fidget
--       lsp_progress = {
--         enable = false,
--       },
--     })
--   end,
-- }
