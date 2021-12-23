-- The same using nvim-mapper
local Mapper = require("nvim-mapper")

local function map(type, input, output, category, unique_identifier, description)
	-- vim.api.nvim_set_keymap(type, input, output, {}, category, unique_identifier, description)
	Mapper.map(type, input, output, {}, category, unique_identifier, description)
end

local function noremap(type, input, output, category, unique_identifier, description)
	-- vim.api.nvim_set_keymap(type, input, output, { noremap = true })
	Mapper.map(type, input, output, { noremap = true }, category, unique_identifier, description)
end

local M = {}

function M.bufnoremap(bufnr, type, input, output, category, unique_identifier, description)
	-- vim.api.nvim_buf_set_keymap(bufnr, type, input, output, {noremap = true, silent = true})
	Mapper.map_buf(
		bufnr,
		type,
		input,
		output,
		{ noremap = true, silent = true },
		category,
		unique_identifier,
		description
	)
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

return M
