local vim = vim
local present_which_key, which_key = pcall(require, "which-key")
local keymap = vim.keymap
local functions = require("lt.utils.functions")

local M = {}

local duplicates_n = {}
local duplicates_v = {}
local duplicates_i = {}
local duplicates_s = {}
local duplicates_x = {}

local function check_and_set_duplicates(input, description, check, table)
  if check then
    local found = table[input]

    if found ~= nil then
      if found ~= description then
        print(input .. " already mapped (" .. found .. " so we cannot map (" .. description .. ")")
      end
    end

    table[input] = description
  end
end

local function check_duplicates(type, input, description)
  local check_n = false
  local check_v = false
  local check_i = false
  local check_s = false
  local check_x = false

  if functions.is_table(type) then
    if type["n"] then
      check_n = true
    end
    if type["v"] then
      check_v = true
    end
    if type["i"] then
      check_i = true
    end
    if type["s"] then
      check_s = true
    end
    if type["x"] then
      check_x = true
    end
  else
    if type == "n" then
      check_n = true
    end
    if type == "v" then
      check_v = true
    end
    if type == "i" then
      check_i = true
    end
    if type == "s" then
      check_s = true
    end
    if type == "x" then
      check_x = true
    end
  end

  check_and_set_duplicates(input, description, check_n, duplicates_n)
  check_and_set_duplicates(input, description, check_v, duplicates_v)
  check_and_set_duplicates(input, description, check_i, duplicates_i)
  check_and_set_duplicates(input, description, check_s, duplicates_s)
  check_and_set_duplicates(input, description, check_x, duplicates_x)
end

local function try_add_to_which_key_by_input(input, description)
  if present_which_key then
    local has_leader = string.find(input, "<leader>")
    if has_leader then
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

  check_duplicates(type, input, description)
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
  check_duplicates(type, input, description)
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
