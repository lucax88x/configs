local M = {}

function M.starts_with(str, start)
	return str:sub(1, #start) == start
end

function M.tprint(table)
	print(vim.inspect(table))
end

M.reload = function()
	local counter = 0

	for moduleName in pairs(package.loaded) do
		if M.starts_with(moduleName, "lt.") then
			require("plenary.reload").reload_module(moduleName)

			counter = counter + 1
		end
	end

	-- clear nvim-mapper keys
	vim.g.mapper_records = nil

	vim.notify("Reloaded " .. counter .. " modules!")
end

function M.is_linux()
	return vim.loop.os_uname().sysname == "Linux"
end

function M.link_highlight(from, to, override)
	local hl_exists, _ = pcall(vim.api.nvim_get_hl_by_name, from, false)
	if override or not hl_exists then
		-- vim.cmd(("highlight link %s %s"):format(from, to))
		vim.api.nvim_set_hl(0, from, { link = to })
	end
end

M.highlight_bg = function(group, col)
	vim.api.nvim_set_hl(0, group, { bg = col })
end

-- Define fg color
-- @param group Group
-- @param color Color
M.highlight_fg = function(group, col)
	vim.api.nvim_set_hl(0, group, { fg = col })
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.highlight_fg_bg = function(group, fgcol, bgcol)
	vim.api.nvim_set_hl(0, group, { bg = bgcol, fg = fgcol })
end

return M
