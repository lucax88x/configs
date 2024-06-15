return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    -- disable until lualine loads
    vim.opt.laststatus = 0
  end,
  opts = function()
    local icons = require("lt.utils.icons")

    local function fg(name)
      return function()
        ---@type {foreground?:number}?
        local hl = vim.api.nvim_get_hl_by_name(name, true)
        return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
      end
    end

    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = "lualine_c_normal",
    })

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        refresh = {
          statusline = 500,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          {
            "diff",
            symbols = {
              added = icons.git.Added,
              modified = icons.git.Modified,
              removed = icons.git.Removed,
            },
          },
        },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          {
            "filetype",
            icon_only = false,
            separator = "",
            padding = {
              left = 1,
              right = 0,
            },
          },
          {
            "filename",
            path = 1,
            fmt = function(path)
              return table.concat(
                { vim.fs.basename(vim.fs.dirname(path)), vim.fs.basename(path) },
                package.config:sub(1, 1)
              )
            end,
            symbols = {
              modified = "  ",
              readonly = "",
              unnamed = "",
            },
          },
          {
            symbols.get,
            cond = symbols.has,
          },
        },
        lualine_x = {
          {
            require("lt.plugins.lualine.codecompanion"),
          },
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = fg("Statement"),
          },
          {
            function()
              return eequire("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
            color = fg("Constant"),
          },
          { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
        },
        lualine_y = {
          {
            "fileformat",
            icons_enabled = true,
          },
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          { "searchcount" },
          { "selectioncount" },
          function()
            return os.date("%R")
          end,
        },
      },
      extensions = { "nvim-dap-ui", "quickfix" },
    }
  end,
}
