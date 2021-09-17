local vimcmd
if vim.api ~= nil then
    vimcmd = vim.api.nvim_command
else
    vimcmd = vim.command
end

local globalListenerName = 'globallistenername' -- change this to be unique across multiple plugin name
local autocmdhandlers = {}

_G[globalListenerName] = function(name)
    local handler = autocmdhandlers[name]
    if handler ~= nil then handler() end
end

function addEventListener(name, events, cb)
    autocmdhandlers[name] = cb
    vimcmd('augroup ' .. name)
    vimcmd('autocmd!')
    for _, v in ipairs(events) do
        local cmd = 'lua ' .. globalListenerName .. '("' .. name .. '")'
        vimcmd('au ' .. v .. ' ' .. cmd)
    end
    vimcmd('augroup end')
end

function removeEventListener(name)
    vimcmd('augroup ' .. name)
    vimcmd('autocmd!')
    vimcmd('augroup end')
    autocmdhandlers[name] = nil
end

