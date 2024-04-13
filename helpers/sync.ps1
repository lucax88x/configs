New-Item -ItemType Junction -Target "$HOME/repos/configs/dotfiles/.config/nvim" -Path "$HOME/AppData/Local/nvim"
New-Item -ItemType Junction -Target "$HOME/repos/configs/dotfiles/.config/wezterm" -Path "$HOME/.config/wezterm"
New-Item -ItemType HardLink -Target "$HOME/repos/configs/dotfiles/pwsh.ps1" -Path "$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
New-Item -ItemType HardLink -Target "$HOME/repos/configs/dotfiles/.gitconfig" -Path "$HOME/.gitconfig"
# New-Item -ItemType HardLink -Target "$HOME/repos/configs/dotfiles/.config/nushell.nu" -Path "$APPDATA/nushell/config.nu" 
New-Item -ItemType Junction -Target "$HOME/repos/configs/dotfiles/.config/nushell" -Path "$HOME/.config/nu" 

