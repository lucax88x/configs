New-Item -ItemType Junction -Target "$HOME/repos/configs/dotfiles/.config/nvim" -Path "$HOME/AppData/Local/nvim"
New-Item -ItemType Junction -Target "$HOME/repos/configs/dotfiles/.config/wezterm" -Path "$HOME/.config/wezterm"
New-Item -ItemType HardLink -Target "$HOME/repos/configs/dotfiles/pwsh.ps1" -Path "$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"

