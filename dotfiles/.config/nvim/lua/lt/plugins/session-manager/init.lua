return {
  "shatur/neovim-session-manager",
  event = "BufReadPre",
  cmd = "SessionManager",
  config = function()
    local session = require("session_manager")

    session.setup({
      -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
      autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
    })
  end,
}
