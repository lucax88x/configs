return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[██╗░░░░░██╗░░░██╗░█████╗░░█████╗░████████╗██████╗░░█████╗░███████╗███████╗██╗]],
      [[██║░░░░░██║░░░██║██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗╚════██║╚════██║██║]],
      [[██║░░░░░██║░░░██║██║░░╚═╝███████║░░░██║░░░██████╔╝███████║░░███╔═╝░░███╔═╝██║]],
      [[██║░░░░░██║░░░██║██║░░██╗██╔══██║░░░██║░░░██╔══██╗██╔══██║██╔══╝░░██╔══╝░░██║]],
      [[███████╗╚██████╔╝╚█████╔╝██║░░██║░░░██║░░░██║░░██║██║░░██║███████╗███████╗██║]],
      [[╚══════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚══════╝╚═╝]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", " New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "󰱼 Find file", ":FzfLua files cwd=$HOME<CR>"),
      dashboard.button("s", " Restore Session", function()
        require("persistence").load({ last = true })
      end),
      dashboard.button("p", " Projects", function()
        require("lt.project.functions").switch_project()
      end),
      dashboard.button("n", " Notes", ":ObsidianSearch<CR>"),
      dashboard.button("r", " Recent files", ":FzfLua oldfiles<CR>"),
      dashboard.button("c", " Config", function()
        require("lt.plugins.fzf.functions").search_config()
      end),
      dashboard.button("u p", " Lazy", ":Lazy<CR>"),
      dashboard.button("u l", " Mason", ":Mason<CR>"),
      dashboard.button("q", "󰿅 Quit NVIM", ":qa<CR>"),
    }

    -- local function footer()
    --     local datetime = os.date("%d-%m-%Y  %H:%M:%S")
    --     return datetime
    -- end
    --
    -- dashboard.section.footer.val = footer()
    -- dashboard.section.footer.opts.hl = "Constant"

    local stats = require("lazy").stats()

    dashboard.section.footer.val = {
      string.format("   %d plugins (%d loaded)", stats.count, stats.loaded),
      "  https://github.com/lucax88x/configs",
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
  end,
}
