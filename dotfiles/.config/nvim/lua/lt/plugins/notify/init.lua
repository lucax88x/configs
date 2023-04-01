local function stage(stages_util)
  return {
    function(state)
      local next_height = state.message.height + 1.5
      local next_row = stages_util.available_slot(state.open_windows, next_height, stages_util.DIRECTION.BOTTOM_UP)
      if not next_row then
        return nil
      end
      return {
        relative = "editor",
        anchor = "NE",
        width = state.message.width,
        height = state.message.height,
        col = vim.opt.columns:get(),
        row = next_row,
        border = "rounded",
        style = "minimal",
        opacity = 0,
      }
    end,
    function()
      return {
        opacity = { 100 },
        col = { vim.opt.columns:get() },
      }
    end,
    function()
      return {
        col = { vim.opt.columns:get() },
        time = true,
      }
    end,
    function()
      return {
        opacity = {
          0,
          frequency = 2,
          complete = function(cur_opacity)
            return cur_opacity <= 4
          end,
        },
        col = { vim.opt.columns:get() },
      }
    end,
  }
end

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
    -- local stages_util = require 'notify.stages.util'

    notify.setup({
      stages = "fade",
      -- stages = stage(stages_util),
      render = "compact",
      top_down = false,
    })

    vim.notify = notify
  end,
}
