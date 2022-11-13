local vim = vim
local present_which_key, which_key = pcall(require, "which-key")
local keymap = vim.keymap

local M = {}

local function try_add_to_which_key_by_input(input, description)
  if present_which_key then
    local leader_index = string.find(input, "<leader>")
    --[[ print(input) ]]
    if leader_index then
      which_key.register({
        [input] = description,
      })
    end
  end
end

function M.map(type, input, output, description, additional_options)
  which_key = which_key or true

  local options = { remap = true, desc = description }
  if additional_options then
    options = vim.tbl_deep_extend("force", options, additional_options)
  end

  keymap.set(type, input, output, options)

  try_add_to_which_key_by_input(input, description)
end

function M.noremap(type, input, output, description, additional_options)
  local options = { remap = false }
  if additional_options then
    options = vim.tbl_deep_extend("force", options, additional_options)
  end

  M.map(type, input, output, description, options)
end

function M.map_virtual(input, description)
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
