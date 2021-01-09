function linkHighlight(from, to)
  local hl_exists, _ = pcall(api.nvim_get_hl_by_name, from, false)
  if not hl_exists then
    vim.cmd(('highlight link %s %s'):format(from, to))
  end
end
