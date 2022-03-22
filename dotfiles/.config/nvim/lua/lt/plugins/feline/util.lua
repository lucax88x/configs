local M = { vi = {} }

M.vi.text = {
  n = "N",
  no = "N",
  i = "I",
  v = "V",
  V = "V-LINE",
  [""] = "V-BLOCK",
  c = "C",
  cv = "C",
  ce = "C",
  R = "R",
  Rv = "R",
  s = "S",
  S = "S",
  [""] = "S",
  t = "T",
}

M.vi.colors = {
  n = "FlnViYellow",
  no = "FlnViYellow",
  i = "FlnStatus",
  v = "FlnViMagenta",
  V = "FlnViMagenta",
  [""] = "FlnViMagenta",
  R = "FlnViRed",
  Rv = "FlnViRed",
  r = "FlnViBlue",
  rm = "FlnViBlue",
  s = "FlnViMagenta",
  S = "FlnViMagenta",
  [""] = "FelnMagenta",
  c = "FlnViYellow",
  ["!"] = "FlnViBlue",
  t = "FlnViBlue",
}

M.vi.sep = {
  n = "FlnYellow",
  no = "FlnYellow",
  i = "FlnStatusBg",
  v = "FlnMagenta",
  V = "FlnMagenta",
  [""] = "FlnMagenta",
  R = "FlnRed",
  Rv = "FlnRed",
  r = "FlnBlue",
  rm = "FlnBlue",
  s = "FlnMagenta",
  S = "FlnMagenta",
  [""] = "FelnMagenta",
  c = "FlnYellow",
  ["!"] = "FlnBlue",
  t = "FlnBlue",
}

M.icons = {
  locker = "", -- #f023
  page = "☰", -- 2630
  line_number = "", -- e0a1
  connected = "", -- f817
  vertical_bar = "┃",
  vertical_bar_thin = "│",
  left = "",
  right = "",
  block = "█",
  left_filled = "",
  right_filled = "",
  slant_left = "",
  slant_left_thin = "",
  slant_right = "",
  slant_right_thin = "",
  slant_left_2 = "",
  slant_left_2_thin = "",
  slant_right_2 = "",
  slant_right_2_thin = "",
  left_rounded = "",
  left_rounded_thin = "",
  right_rounded = "",
  right_rounded_thin = "",
  circle = "●",
}

M.get_lsp_client = function(msg, ignored_servers)
  msg = msg or "No Active Lsp"
  ignored_servers = ignored_servers or {}

  local clients = vim.lsp.buf_get_clients()
  if next(clients) == nil then
    return msg
  end

  local client_names = ""
  for _, client in pairs(clients) do
    if not vim.tbl_contains(ignored_servers, client.name) then
      if string.len(client_names) < 1 then
        client_names = client_names .. client.name
      else
        client_names = client_names .. ", " .. client.name
      end
    end
  end
  return string.len(client_names) > 0 and client_names or msg
end

return M
