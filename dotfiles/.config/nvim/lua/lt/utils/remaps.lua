local present_which_key, which_key = pcall(require, "which-key")
local key = vim.keymap

local M = {}

local conflicts = {}
local functions = require("lt.utils.functions")

local function check_conflicts(type, input, unique_identifier)
	-- local conflict_key = type .. input
	--
	-- if conflicts[conflict_key] ~= nil then
	-- 	print("(t)" .. type .. " " .. input .. " conflicts! [" .. unique_identifier .. "]")
	-- end
	--
	-- conflicts[conflict_key] = true
end

local function try_add_to_which_key_by_input(input, description)
	if present_which_key then
		local leader_index = string.find(input, "<leader>")
		-- print(input)
		if leader_index then
			which_key.register({
				[input] = description,
			})
		end
	end
end

function M.map(type, input, output, unique_identifier, description, additional_options)
	local options = { remap = true, desc = description }
	if additional_options then
		options = vim.tbl_deep_extend("force", options, additional_options)
	end

	key.set(type, input, output, options)

	if not options.buffer then
		check_conflicts(type, input, unique_identifier)
	end

	try_add_to_which_key_by_input(input, description)
end

function M.noremap(type, input, output, unique_identifier, description, additional_options)
	local options = { remap = false }
	if additional_options then
		options = vim.tbl_deep_extend("force", options, additional_options)
	end

	M.map(type, input, output, unique_identifier, description, options)
end

function M.map_virtual(type, input, description)
	try_add_to_which_key_by_input(input, description)
end

function M.which_key(input, description)
	if present_which_key then
		which_key.register({
			[input] = description,
		})
	end
end

return M
