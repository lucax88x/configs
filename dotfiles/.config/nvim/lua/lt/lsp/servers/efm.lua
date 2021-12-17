local lsp = require 'lspconfig'

local luaformat = require 'lt.lsp.servers.formatters.lua-format'
local prettier_d = require 'lt.lsp.servers.formatters.prettier_d'
local eslint_d = require 'lt.lsp.servers.linters.eslint_d'
local yaml_lint = require 'lt.lsp.servers.linters.yaml_lint'

local languages = {
  lua = {luaformat},
  typescript = {prettier_d, eslint_d},
  javascript = {prettier_d, eslint_d},
  typescriptreact = {prettier_d, eslint_d},
  ['typescript.tsx'] = {prettier_d, eslint_d},
  javascriptreact = {prettier_d, eslint_d},
  ['javascript.jsx'] = {prettier_d, eslint_d},
  vue = {prettier_d, eslint_d},
  yaml = {prettier_d, yaml_lint},
  html = {prettier_d},
  scss = {prettier_d},
  css = {prettier_d},
  markdown = {prettier_d}
}

--[[ local efm_config = os.getenv('HOME') ..
                         '/.config/efm-langserver/config.yaml'
                         
        cmd = {
          bin_path,
          "-c",
           efm_config,
          "-loglevel",
          "10",
          "-logfile",
          "/tmp/efm.log" 
        }, ]]

--[[ local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
  local test = vim.fn.glob("package.json*")

  functions.tprint(eslintrc)
  functions.tprint(test)
  if not vim.tbl_isempty(eslintrc) then
    return true
  end
  -- print (vim.fn.getcwd())
  -- functions.tprint (lsp.util.root_pattern("package.json", ".git", vim.fn.getcwd()))
  local r = lsp.util.root_pattern(".eslintrc*")

  -- print(lsp.util.find_git_root())
  -- print(lsp.util.find_node_modules_root())
  -- print(lsp.util.find_package_json_root())
  functions.tprint (r)

  print ('no rc found')

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  print ('not in json')
  return false
end ]]

return function()
  return {
    root_dir = function(fname)
      --[[ if not eslint_config_exists() then
            print 'eslint configuration not found'
            return nil
          end]]
      -- check if eslint_d installed globally!
      -- return lsp.util.root_pattern("package.json", ".git", vim.fn.getcwd())
      -- return getcwd()
      local cwd = lsp.util.root_pattern('tsconfig.json')(fname) or
                      lsp.util.root_pattern('.eslintrc.json', '.git')(fname) or
                      lsp.util
                          .root_pattern('package.json', '.git/', '.zshrc')(fname);
      return cwd
    end,
    filetypes = vim.tbl_keys(languages),
    init_options = {documentFormatting = true},
    settings = {
      rootMarkers = {'package.json', '.git'},
      lintDebounce = 500,
      languages = languages
    }
  }
end
