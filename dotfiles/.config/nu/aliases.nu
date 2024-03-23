let is_linux: bool = (sys | get host.long_os_version | str downcase | str contains "linux")
let is_wsl: bool = (sys | get host.kernel_version | str downcase | str contains "microsoft")
let is_mac: bool = (sys | get host.long_os_version | str downcase | str contains "macos")

alias g = git