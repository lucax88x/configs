-- npm add --global prettier_d_slim
local prettier  = {
  formatCommand = "prettier_d_slim --stdin --stdin-filepath ${INPUT}",
  formatStdin = true
}

return prettier
