require('neoscroll').setup()

local t = {}
-- https://github.com/karb94/neoscroll.nvim/blob/master/lua/neoscroll/config.lua
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '200'}}
t['<C-d>'] = {'scroll', {'vim.wo.scroll', 'true', '200'}}
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '200'}}
t['<C-f>'] = {'scroll', {'vim.api.nvim_win_get_height(0)', 'true', '200'}}
t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
t['<C-e>'] = {'scroll', {'0.10', 'false', '100'}}
t['zt'] = {'zt', {'200'}}
t['zz'] = {'zz', {'200'}}
t['zb'] = {'zb', {'200'}}

require('neoscroll.config').set_mappings(t)

