return {
  "ahmedkhalf/project.nvim",
  init = function()
    local project = require("project_nvim")
    project.setup({
      manual_mode = true,
      patterns = { ".git", "package.json", ".projectile" },
      -- silent_chdir = false,
    })
  end,
  keys = {
    {
      "<leader>pp",
      function()
        local project = require("lt.plugins.project.functions")
        project.switch_project()
      end,
      desc = "Switch projects",
    },
    {
      "<leader>pa",
      function()
        local current_cwd = vim.loop.cwd();
        -- local test = vim.fn.input("File: ", "", "file")

        vim.notify("Adding project " .. current_cwd)
        vim.cmd("ProjectRoot \"" .. current_cwd .. "\"")
      end,
      desc = "Add current working directory to project list",
    },
  },
}
