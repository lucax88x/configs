return function(language_server_path)
    local bin_path = language_server_path .. "/html-languageserver/html-languageserver"
    return {
        cmd = {bin_path, "--stdio"},
    }
end
