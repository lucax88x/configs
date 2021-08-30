return function(language_server_path)
    local bin_path = language_server_path .. "/sumneko-lua-language-server/sumneko-lua-language-server"

    local luadev = require("lua-dev").setup({
      lspconfig= {
        cmd = {bin_path},
      }
    })

    return luadev;
end
