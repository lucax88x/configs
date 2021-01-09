return function(language_server_path)
    local bin_path = language_server_path .. "/css-languageserver/css-languageserver"
    return {
        cmd = {bin_path, "--stdio"},
    }
end
