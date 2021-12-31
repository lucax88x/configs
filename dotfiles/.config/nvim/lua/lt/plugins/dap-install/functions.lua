local M = {}

M.dap_install_servers = function()
	local function installDebugServer(debugServer)
		vim.cmd("DIInstall " .. debugServer)
	end

	installDebugServer("chrome")
	installDebugServer("ccppr_vsc")
end

return M