return {
  "ahmedkhalf/project.nvim",
  config = function()
    local project = require("project_nvim")
    project.setup({
      patterns = { ".git", "package.json", ".projectile" },
    })
  end,
}
