return function(language_server_path)
    local bin_path = language_server_path .. "/yaml-language-server/yaml-language-server"
    return {
        cmd = {bin_path, "--stdio"},
    }
end
