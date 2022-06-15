local presentNavic, navic = pcall(require, "nvim-navic")

local WINBAR = {}

if presentNavic then
  navic.setup({})

  WINBAR[1] = {
    provider = function()
      return navic.get_location()
    end,
    enabled = function()
      return navic.is_available()
    end,
  }
end

return WINBAR
