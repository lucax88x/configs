local M = {}

M.search_config = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimConfig >",
        cwd = "$HOME/.config/nvim",
    })
end

return M
