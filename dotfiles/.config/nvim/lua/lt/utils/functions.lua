local M = {}

function M.starts_with(str, start)
   return str:sub(1, #start) == start
end

function M.tprint(table)
  print(vim.inspect(table))
end

function M.linkHighlight(from, to)
  local hl_exists, _ = pcall(vim.api.nvim_get_hl_by_name, from, false)
  if not hl_exists then
    vim.cmd(('highlight link %s %s'):format(from, to))
  end
end

return M;
