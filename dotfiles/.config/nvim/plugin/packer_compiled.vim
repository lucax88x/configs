" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
try

lua << END
  local package_path_str = "/home/lucatrazzi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lucatrazzi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lucatrazzi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lucatrazzi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
  local install_cpath_pattern = "/home/lucatrazzi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

_G.packer_plugins = {
  ["BufOnly.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/BufOnly.nvim"
  },
  CamelCaseMotion = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/CamelCaseMotion"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["better-escape.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/better-escape.vim"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/ctrlsf.vim"
  },
  firenvim = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  fzf = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lightline-gruvbox.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/lightline-gruvbox.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["sideways.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/sideways.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  undotree = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-commentary"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-cool"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-devicons"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dirvish"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-expand-region"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-expand-region"
  },
  ["vim-fugitive"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-illuminate"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-lsp-settings"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-lsp-settings"
  },
  ["vim-man"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-man"
  },
  ["vim-orgmode"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-orgmode"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-repeat"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-smoothie"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-sneak"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-startify"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vim-which-key"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/home/lucatrazzi/.local/share/nvim/site/pack/packer/start/vim-which-key"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = packer_plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

local packer_load = nil
local function handle_after(name, before)
  local plugin = packer_plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if packer_plugins[name].commands then
      for _, cmd in ipairs(packer_plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if packer_plugins[name].keys then
      for _, key in ipairs(packer_plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if packer_plugins[name].config then
        for _i, config_line in ipairs(packer_plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if packer_plugins[name].after then
        for _, after_name in ipairs(packer_plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      packer_plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    local escaped_keys = vim.api.nvim_replace_termcodes(cause.keys .. extra, true, true, true)
    vim.api.nvim_feedkeys(escaped_keys, 'm', true)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

_packer_load_wrapper = function(names, cause)
  success, err_msg = pcall(packer_load, names, cause)
  if not success then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "Error in packer_compiled: ' .. vim.fn.escape(err_msg, '"') .. '"')
    vim.cmd('echomsg "Please check your config for correctness"')
    vim.cmd('echohl None')
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
  call luaeval('_packer_load_wrapper(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  " Event lazy-loads
  " Function lazy-loads
augroup END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
