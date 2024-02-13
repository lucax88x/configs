return {
  "ahmedkhalf/project.nvim",
  init = function()
    local project = require("project_nvim")
    project.setup({
      patterns = { ".git", "package.json", ".projectile" },
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
  },
}
