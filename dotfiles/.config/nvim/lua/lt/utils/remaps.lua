local present_mapper, mapper = pcall(require, "nvim-mapper")
local present_which_key, which_key = pcall(require, "which-key")

local M = {}

if present_mapper then
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
		-- vim.api.nvim_set_keymap(type, input, output, {}, category, unique_identifier, description)
		mapper.map(type, input, output, {}, category, unique_identifier, description)

		check_conflicts(type, input, unique_identifier)

		try_add_to_whick_key_by_input(input, description)
	end

	local function noremap(type, input, output, category, unique_identifier, description)
		-- vim.api.nvim_set_keymap(type, input, output, { noremap = true })
		mapper.map(type, input, output, { noremap = true }, category, unique_identifier, description)

		check_conflicts(type, input, unique_identifier)

		try_add_to_whick_key_by_input(input, description)
	end

	function M.bufnoremap(bufnr, type, input, output, category, unique_identifier, description)
		-- vim.api.nvim_buf_set_keymap(bufnr, type, input, output, {noremap = true, silent = true})
		mapper.map_buf(
			bufnr,
			type,
			input,
			output,
			{ noremap = true, silent = true },
			category,
			unique_identifier,
			description
		)

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

	function M.map_virtual(type, input, output, category, unique_identifier, description)
		mapper.map_virtual(type, input, output, category, unique_identifier, description)
	end

	function M.whick_key(input, description)
		if present_which_key then
			which_key.register({
				[input] = description,
			})
		end
	end
else
	local function map(type, input, output)
		vim.api.nvim_set_keymap(type, input, output, {})
	end

	local function noremap(type, input, output)
		vim.api.nvim_set_keymap(type, input, output, { noremap = true })
	end

	function M.bufnoremap(bufnr, type, input, output)
		vim.api.nvim_buf_set_keymap(bufnr, type, input, output, { noremap = true, silent = true })
	end

	function M.nnoremap(input, output)
		noremap("n", input, output)
	end

	function M.inoremap(input, output)
		noremap("i", input, output)
	end

	function M.vnoremap(input, output)
		noremap("v", input, output)
	end

	function M.xnoremap(input, output)
		noremap("x", input, output)
	end

	function M.onoremap(input, output)
		noremap("o", input, output)
	end

	function M.tnoremap(input, output)
		noremap("t", input, output)
	end

	function M.nmap(input, output)
		map("n", input, output)
	end

	function M.imap(input, output)
		map("i", input, output)
	end

	function M.vmap(input, output)
		map("v", input, output)
	end

	function M.xmap(input, output)
		map("x", input, output)
	end

	function M.omap(input, output)
		map("o", input, output)
	end

	function M.tmap(input, output)
		map("t", input, output)
	end

	function M.map_virtual(_, _, _, _, _, _) end

	function M.whick_key(_, _) end
end

return M
