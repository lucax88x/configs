local M = {}

function M.run(program, args, callback)
  local task_output = ""
  local task_error = ""

  local str_args = {}
  for key, value in pairs(args) do
    str_args[key] = tostring(value)
  end

  local task = hs.task.new(program, nil, function(_, stdout, stderr)
    --[[ print("stdout:"..stdout, "stderr:"..stderr) ]]
    if stdout ~= nil then
      task_output = task_output .. stdout
    end
    if stderr ~= nil then
      task_error = task_error .. stderr
    end
    return true
  end, str_args)

  if type(callback) == "function" then
    task:setCallback(function()
      callback(task_output, task_error)
    end)
  end

  task:start()
end

return M
