local M = {}

M.switch_project = function()
  local contents = require("project_nvim").get_recent_projects()
  local reverse = {}
  for i = #contents, 1, -1 do
    reverse[#reverse + 1] = contents[i]
  end
  require("fzf-lua").fzf_exec(reverse, {
    actions = {
      ["default"] = function(e)
        local path = e[1]
        vim.cmd.cd(path)
        -- vim.cmd("ProjectRoot '" .. path .. "'")
        vim.cmd("Oil " .. path)
      end,
      ["ctrl-d"] = function(x)
        local choice = vim.fn.confirm("Delete '" .. #x .. "' projects? ", "&Yes\n&No", 2)
        if choice == 1 then
          local history = require("project_nvim.utils.history")
          for _, v in ipairs(x) do
            history.delete_project(v)
          end
        end
      end,
    },
  })
end

return M
