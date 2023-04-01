local keymap = vim.keymap
local check_duplicates = require("lt.utils.remaps.duplicates").check_duplicates

local M = {}

local which_key_lazy_registers = nil
local function lazy_register_which_key(input, description)
  if which_key_lazy_registers == nil then
    which_key_lazy_registers = {}
  end

  which_key_lazy_registers[input] = description
end

local function try_add_to_which_key_by_input(input, description)
  local present_which_key, which_key = pcall(require, "which-key")

  local has_leader = string.find(input, "<leader>")
  if has_leader then
    if present_which_key then
      if which_key_lazy_registers ~= nil then
        which_key.register(which_key_lazy_registers)

        which_key_lazy_registers = nil
      end

      which_key.register({
        [input] = description,
      })
    else
      lazy_register_which_key(input, description)
    end
  end
end

function M.map(type, input, output, description, additional_options)
  local options = { remap = true, desc = description }
  if additional_options then
    options = vim.tbl_deep_extend("force", options, additional_options)
  end

  keymap.set(type, input, output, options)

  check_duplicates(type, input, description)
end

function M.noremap(type, input, output, description, additional_options)
  local options = { remap = false }
  if additional_options then
    options = vim.tbl_deep_extend("force", options, additional_options)
  end

  M.map(type, input, output, description, options)
end

function M.map_virtual(input, description)
  check_duplicates(type, input, description)
  try_add_to_which_key_by_input(input, description)
end

function M.which_key(input, description)
  try_add_to_which_key_by_input(input, description)
end

return M
