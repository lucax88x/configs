#
# Linux software installer scripts

very simple scripts for installing all necessary tools for developing

how to run


```shell
./scripts/install.mts --distro ARCH|WIN|OSX
```

if in ARCH you need to install first npm
  
```shell
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S volta-bin
```

**DO NOT RUN AS SUDO!**

# Gallery


![https://imgur.com/Dzse3aV](https://i.imgur.com/Dzse3aV.png)

