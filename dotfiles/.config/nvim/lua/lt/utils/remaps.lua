local present_which_key, which_key = pcall(require, "which-key")
local key = vim.keymap

local M = {}

local conflicts = {}

local function check_conflicts(type, input, unique_identifier)
	local key = type .. input

	if conflicts[key] ~= nil then
		print("[t]" .. type .. " [i]" .. input .. " conflicts! [" .. unique_identifier .. "]")
	end

	conflicts[key] = true
end

local function try_add_to_whick_key_by_input(input, description)
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

local function map(type, input, output, category, unique_identifier, description)
	key.set(type, input, output, { desc = description })

	check_conflicts(type, input, unique_identifier)

	try_add_to_whick_key_by_input(input, description)
end

local function noremap(type, input, output, category, unique_identifier, description)
	-- vim.api.nvim_set_keymap(type, input, output, { noremap = true })
	key.set(type, input, output, { noremap = true, desc = description })

	check_conflicts(type, input, unique_identifier)

	try_add_to_whick_key_by_input(input, description)
end

function M.map_virtual(type, input, output, category, unique_identifier, description)
	try_add_to_whick_key_by_input(input, description)
end

function M.bufnoremap(bufnr, type, input, output, category, unique_identifier, description)
	-- vim.api.nvim_buf_set_keymap(bufnr, type, input, output, {noremap = true, silent = true})
	key.set(type, input, output, { noremap = true, silent = true, buffer = bufnr })

	try_add_to_whick_key_by_input(input, description)
end

function M.nnoremap(input, output, category, unique_identifier, description)
	noremap("n", input, output, category, unique_identifier, description)
end

function M.inoremap(input, output, category, unique_identifier, description)
	noremap("i", input, output, category, unique_identifier, description)
end

function M.vnoremap(input, output, category, unique_identifier, description)
	noremap("v", input, output, category, unique_identifier, description)
end

function M.xnoremap(input, output, category, unique_identifier, description)
	noremap("x", input, output, category, unique_identifier, description)
end

function M.onoremap(input, output, category, unique_identifier, description)
	noremap("o", input, output, category, unique_identifier, description)
end

function M.tnoremap(input, output, category, unique_identifier, description)
	noremap("t", input, output, category, unique_identifier, description)
end

function M.cnoremap(input, output, category, unique_identifier, description)
	noremap("c", input, output, category, unique_identifier, description)
end

function M.nmap(input, output, category, unique_identifier, description)
	map("n", input, output, category, unique_identifier, description)
end

function M.imap(input, output, category, unique_identifier, description)
	map("i", input, output, category, unique_identifier, description)
end

function M.vmap(input, output, category, unique_identifier, description)
	map("v", input, output, category, unique_identifier, description)
end

function M.xmap(input, output, category, unique_identifier, description)
	map("x", input, output, category, unique_identifier, description)
end

function M.omap(input, output, category, unique_identifier, description)
	map("o", input, output, category, unique_identifier, description)
end

function M.tmap(input, output, category, unique_identifier, description)
	map("t", input, output, category, unique_identifier, description)
end

function M.whick_key(input, description)
	if present_which_key then
		which_key.register({
			[input] = description,
		})
	end
end

return M
