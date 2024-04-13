local M = {}

function M.search_config()
  require("fzf-lua").files({
    prompt = "< Config >",
    cwd = "$HOME/.config/nvim",
  })
end

return M
