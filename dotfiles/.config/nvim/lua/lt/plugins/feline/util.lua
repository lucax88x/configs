local vim = vim

local M = { vi = {} }

M.vi.modes = setmetatable({
	n = { "Normal", "N" },
	no = { "N·Pending", "N·P" },
	v = { "Visual", "V" },
	V = { "V·Line", "V·L" },
	[""] = { "V·Block", "V·B" },
	s = { "Select", "S" },
	S = { "S·Line", "S·L" },
	[""] = { "S·Block", "S·B" },
	i = { "Insert", "I" },
	ic = { "Insert", "I" },
	R = { "Replace", "R" },
	Rv = { "V·Replace", "V·R" },
	c = { "Command", "C" },
	cv = { "Vim·Ex ", "V·E" },
	ce = { "Ex ", "E" },
	r = { "Prompt ", "P" },
	rm = { "More ", "M" },
	["r?"] = { "Confirm ", "C" },
	["!"] = { "Shell ", "S" },
	t = { "Terminal ", "T" },
}, {
	__index = function()
		return { "Unknown", "U" } -- handle edge cases
	end,
})

M.vi.colors = {
	n = "FlnViYellow",
	no = "FlnViYellow",
	i = "FlnViGreen",
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
	i = "FlnGreen",
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

local trunc_width = setmetatable({
	-- You can adjust these values to your liking, if you want
	-- I promise this will all makes sense later :)
	mode = 140,
	git_status = 90,
	filename = 140,
	line_col = 60,
}, {
	__index = function()
		return 80 -- handle edge cases, if there's any
	end,
})

local function is_truncated(width)
	local current_width = vim.api.nvim_win_get_width(0)
	return current_width < width
end

M.get_current_mode = function()
	local current_mode = vim.api.nvim_get_mode().mode

	if is_truncated(trunc_width.mode) then
		return string.format(" %s ", M.vi.modes[current_mode][2]):upper()
	end

	return string.format(" %s ", M.vi.modes[current_mode][1]):upper()
end

return M
