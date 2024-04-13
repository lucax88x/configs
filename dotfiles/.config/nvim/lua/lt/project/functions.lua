local M = {}

M.switch_project = function()
  local repo_directory = "$HOME/repos"
  local repo_directories = vim.fs.dir(repo_directory, { depth = 1, type = "directory" })

  local projects = {}
  for name, type in repo_directories do
    if type == "directory" then
      projects[#projects + 1] = vim.fs.normalize(vim.fs.joinpath(repo_directory, name))
    end
  end

  require("fzf-lua").fzf_exec(projects, {
    prompt = "Projects",
    actions = {
      ["default"] = function(e)
        local path = e[1]
        vim.cmd.cd(path)
        -- vim.cmd("ProjectRoot '" .. path .. "'")
        vim.cmd("Oil " .. path)
      end,
    },
  })
end

return M
