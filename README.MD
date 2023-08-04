#
# Linux software installer scripts

very simple scripts for installing all necessary tools for developing

how to run


```shell
./scripts/install.mts --distro ARCH|WIN|OSX
```

after installing arch, remember to install:

enable multilib
https://wiki.archlinux.org/title/Official_repositories#multilib
enable parallel download


git
networkmanager 
sudo systemctl enable NetworkManager.service
sudo systemctl enable wpa_supplicant.service
# amd-ucode thermald
# xorg-server
# plasma-meta kde-system-meta  dolphin
# vulkan-radeon lib32-vulkan-radeon mesa lib32-mesa xf86-video-amdgpu vulkan-icd-loader lib32-vulkan-icd-loader
# 


if in ARCH you need to install first npm
  
```shell
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S volta-bin
volta setup
volta install node
volta install pnpm
```

**DO NOT RUN AS SUDO!**

# Gallery


![https://imgur.com/Dzse3aV](https://i.imgur.com/Dzse3aV.png)


scoop install main/git
scoop bucket add extras
scoop bucket add versions
scoop bucket add nerd-fonts
scoop install extras/googlechrome
scoop install extras/jetbrains-toolbox
scoop install main/gh
scoop install extras/windows-terminal
scoop install extras/vscode
scoop install versions/neovim-nightly
scoop install main/delta
scoop install main/pwsh
scoop install main/zig
scoop install main/deno
scoop install main/nodejs
scoop install main/make
scoop install nerd-fonts/JetBrains-Mono
scoop install nerd-fonts/JetBrainsMono-NF-Mono
scoop install extras/telegram
scoop install extras/slack
scoop install extras/switcheroo
scoop install extras/keypirinha
scoop install main/docker
scoop install extras/rancher-desktop
scoop install wget curl
scoop install unzip gzip
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json 
