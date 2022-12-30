return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  config = function()
    local telescope = require("telescope")

    local functions = require("lt.utils.functions")

    telescope.setup({
      defaults = {
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        -- layout_config = { prompt_position = "bottom" },
      },
      pickers = {
        buffers = {
          sort_lastused = true,
          sort_mru = true,
          previewer = false,
          theme = "dropdown",
          ignore_current_buffer = true,
        },
        find_files = { theme = "dropdown", previewer = false },
        git_files = { theme = "dropdown", previewer = false },
        registers = { theme = "dropdown" },
        lsp_code_actions = {
          theme = "cursor",
          layout_config = {
            height = 12,
          },
        },
        lsp_range_code_actions = { theme = "cursor" },
        loclist = { previewer = false },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            -- even more opts
          }),
        },
      },
    })

    require("lt.plugins.telescope.remaps")

    telescope.load_extension("ui-select")

    if functions.is_macunix() then
      telescope.load_extension("fzf")
    else
      vim.notify("not using fzf")
    end

    if pcall(require, "project_nvim") then
      telescope.load_extension("projects")
    end

    if pcall(require, "harpoon") then
      telescope.load_extension("harpoon")
    end

    if pcall(require, "dap") then
      telescope.load_extension("dap")
    end

    if pcall(require, "refactoring") then
      telescope.load_extension("refactoring")
    end
  end,
}
