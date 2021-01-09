local M = {}

function M.starts_with(str, start)
   return str:sub(1, #start) == start
end

function M.tprint(table)
  print(vim.inspect(table))
end

return M;
