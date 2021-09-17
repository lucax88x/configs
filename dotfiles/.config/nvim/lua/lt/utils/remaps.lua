-- The same using nvim-mapper
Mapper = require('nvim-mapper')

local function map(type, input, output, category, unique_identifier, description)
    -- vim.api.nvim_set_keymap(type, input, output, {}, category, unique_identifier, description)
    Mapper.map(type, input, output, {}, category, unique_identifier, description)
end

local function noremap(type, input, output, category, unique_identifier,
                       description)
    -- vim.api.nvim_set_keymap(type, input, output, { noremap = true })
    Mapper.map(type, input, output, {noremap = true}, category,
               unique_identifier, description)
end

function bufnoremap(bufnr, type, input, output, category, unique_identifier,
                    description)
    -- vim.api.nvim_buf_set_keymap(bufnr, type, input, output, {noremap = true, silent = true})
    Mapper.map_buf(bufnr, type, input, output, {noremap = true, silent = true},
                   category, unique_identifier, description)
end

function nnoremap(input, output, category, unique_identifier, description)
    noremap('n', input, output, category, unique_identifier, description)
end

function inoremap(input, output, category, unique_identifier, description)
    noremap('i', input, output, category, unique_identifier, description)
end

function vnoremap(input, output, category, unique_identifier, description)
    noremap('v', input, output, category, unique_identifier, description)
end

function xnoremap(input, output, category, unique_identifier, description)
    noremap('x', input, output, category, unique_identifier, description)
end

function onoremap(input, output, category, unique_identifier, description)
    noremap('o', input, output, category, unique_identifier, description)
end

function tnoremap(input, output, category, unique_identifier, description)
    noremap('t', input, output, category, unique_identifier, description)
end

function cnoremap(input, output, category, unique_identifier, description)
    noremap('c', input, output, category, unique_identifier, description)
end

function nmap(input, output, category, unique_identifier, description)
    map('n', input, output, category, unique_identifier, description)
end

function imap(input, output, category, unique_identifier, description)
    map('i', input, output, category, unique_identifier, description)
end

function vmap(input, output, category, unique_identifier, description)
    map('v', input, output, category, unique_identifier, description)
end

function xmap(input, output, category, unique_identifier, description)
    map('x', input, output, category, unique_identifier, description)
end

function omap(input, output, category, unique_identifier, description)
    map('o', input, output, category, unique_identifier, description)
end

function tmap(input, output, category, unique_identifier, description)
    map('t', input, output, category, unique_identifier, description)
end
