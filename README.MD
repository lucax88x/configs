#
# Linux software installer scripts

very simple scripts for installing all necessary tools for developing

how to run


```shell
./scripts/install.mts --distro ARCH|OSX
```

```shell
npx tsx ./scripts/install.mts --distro WIN
```

after installing arch, remember to install:

enable multilib
https://wiki.archlinux.org/title/Official_repositories#multilib
enable parallel download


git
networkmanager 
sudo systemctl enable NetworkManager.service
sudo systemctl enable wpa_supplicant.service

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


scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json 

Install-Module -Name PSFzf -Scope CurrentUser -Force


