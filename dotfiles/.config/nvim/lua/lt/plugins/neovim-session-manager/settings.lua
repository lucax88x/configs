local present, session = pcall(require, 'session_manager')

if not (present) then
	return
end

session.setup({
    -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
})
