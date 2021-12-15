#!/bin/bash
. ./installers.sh

DISTRO=${1^^}

case $DISTRO in
  UBUNTU)
    echo installing for ubuntu
  ;;
  ARCH)
    echo installing for arch
  ;;
  *)
    echo not supported distro
    exit 1
  ;;
esac

TEMP_DIR=~/setup-temp
EMAIL=lucax88x@gmail.com
NERDFONT_VERSION=2.0.0
JETBRAINS_MONO_VERSION=2.221
JETBRAINS_TOOLBOX=jetbrains-toolbox-1.19.7784

mkdir -p $TEMP_DIR
cd $TEMP_DIR

echo '# GLOBAL SOFTWARE #'

if ! [ -x "$(command -v make)" ]; then
  echo INSTALLING BASE-DEVEL
  installBaseDevel
else
  echo BASE-DEVEL ALREADY INSTALLED
fi

if ! [ -x "$(command -v make)" ]; then
  echo INSTALLING BASE-DEVEL
  installBaseDevel
else
  echo BASE-DEVEL ALREADY INSTALLED
fi


if ! [ -x "$(command -v rustup)" ]; then
  echo INSTALLING RUSTUP
  installRust
else
  echo RUST ALREADY INSTALLED
fi

if ! [ -x "$(command -v go)" ]; then
  echo INSTALLING GO
  installGo
else
  echo GO ALREADY INSTALLED
fi

if ! [ -x "$(command -v git)" ]; then
  echo INSTALLING GIT
  installGit
else
  echo GIT ALREADY INSTALLED
fi

if ! [ -x "$(command -v paru)" ]; then
  echo INSTALLING PARU
  installParu
else
  echo PARU ALREADY INSTALLED
fi

if ! [ -x "$(command -v wget)" ]; then
  echo INSTALLING WGET
  installWget
else
  echo WGET ALREADY INSTALLED
fi

if ! [ -x "$(command -v curl)" ]; then
  echo INSTALLING CURL
  installCurl
else
  echo CURL ALREADY INSTALLED
fi

if ! [ -x "$(command -v ssh-keygen)" ]; then
  echo INSTALLING SSH
  installSsh
else
  echo SSH ALREADY INSTALLED
fi

if ! [ -x "$(command -v unzip)" ]; then
  echo INSTALLING UNZIP
  installUnzip
else
  echo UNZIP ALREADY INSTALLED
fi

echo '# SOFTWARE #'

if ! [ "$(fc-list | grep -c 'JetBrains')" -ge 1 ]; then
  echo INSTALLING JETBRAINS MONO
  installJetbrainsMono
else
  echo JETBRAINS MONO ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'Open Sans')" -ge 1 ]; then
  echo INSTALLING OPEN SANS
  installOpenSans
else
  echo OPEN SANS ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'Fura Code')" -ge 1 ]; then
  echo INSTALLING PATCHED FIRACODE
  installFuraCode
else
  echo PATCHED FIRACODE ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'Font Awesome 5 Free')" -ge 1 ]; then
  echo INSTALLING FONTAWESOME
  installFontAwesome
else
  echo FONTAWESOME ALREADY INSTALLED
fi

if ! [ "pacman -Qs freetype2-ultimate5 > /dev/null" ]; then
  echo INSTALLING FREETYPE PATCHED
  installFreeType
else
  echo PATCHED FREETYPE ALREADY INSTALLED
fi

exit

if ! [ -x "$(command -v bat)" ]; then
  echo INSTALLING BAT
  installBat
else
  echo BAT ALREADY INSTALLED
fi

if ! [ -x "$(command -v lsd)" ]; then
  echo INSTALLING LSD
  installLsd
else
  echo LSD ALREADY INSTALLED
fi

if ! [ -x "$(command -v zsh)" ]; then
  echo INSTALLING ZSH
  installZsh
else
  echo ZSH ALREADY INSTALLED
fi

if ! [ -x "$(command -v google-chrome-stable)" ]; then
  echo INSTALLING CHROME
  installChrome
else
  echo CHROME ALREADY INSTALLED
fi

if ! [ -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ]; then
  echo INSTALLING JETBRAINS TOOLBOX
  installJetbrainsToolbox
else
  echo JETBRAINS TOOLBOX ALREADY INSTALLED
fi

if ! [ -x "$(command -v telegram-desktop)" ]; then
  echo INSTALLING TELEGRAM
  installTelegram
else
  echo TELEGRAM ALREADY INSTALLED
fi

if ! [ -x "$(command -v bd)" ]; then
  echo INSTALLING BD
  installBd
else
  echo BD ALREADY INSTALLED
fi

if ! [ -x "$(command -v xclip)" ]; then
  echo INSTALLING XCLIP
  installXClip
else
  echo XCLIP ALREADY INSTALLED
fi

if ! [ -x "$(command -v smerge)" ]; then
  echo INSTALLING SUBLIME MERGE
  installSublimeMerge
else
  echo SUBLIME MERGE ALREADY INSTALLED
fi

if ! [ -x "$(command -v dotnet)" ]; then
  echo INSTALLING DOTNETCORE SDK
  installDotnetSdk
else
  echo DOTNETCORE SDK ALREADY INSTALLED
fi

if ! [ -x "$(command -v node)" ]; then
  echo INSTALLING NODE
  installNode
else
  echo NODE ALREADY INSTALLED
fi

if ! [ -x "$(command -v yarn)" ]; then
  echo INSTALLING YARN
  installYarn
else
  echo YARN ALREADY INSTALLED
fi

if ! [ -x "$(command -v docker)" ]; then
  echo INSTALLING DOCKER
  installDocker
else
  echo DOCKER ALREADY INSTALLED
fi

if ! [ -x "$(command -v docker-compose)" ]; then
  echo INSTALLING DOCKER-COMPOSE
  installDockerCompose
else
  echo DOCKER-COMPOSE ALREADY INSTALLED
fi

if ! [ -x "$(command -v teams)" ]; then
  echo INSTALLING TEAMS
  installTeams
else
  echo TEAMS ALREADY INSTALLED
fi

if ! [ -x "$(command -v kubectl)" ]; then
  echo INSTALLING KUBECTL
  installKubectl
else
  echo KUBECTL ALREADY INSTALLED
fi

if ! [ -x "$(command -v slack)" ]; then
  echo INSTALLING SLACK
  installSlack
else
  echo SLACK ALREADY INSTALLED
fi

if [ ! -f ~/.config/i3/config ]; then
  echo INSTALLING I3
  installI3
else
  echo I3 ALREADY INSTALLED
fi

if ! [ -x "$(command -v rofi)" ]; then
  echo INSTALLING ROFI
  installRofi
else
  echo ROFI ALREADY INSTALLED
fi

if ! [ -x "$(command -v dunst)" ]; then
  echo INSTALLING DUNST
  installDunst
else
  echo DUNST ALREADY INSTALLED
fi

if ! [ -x "$(command -v kitty)" ]; then
  echo INSTALLING KITTY
  installKitty
else
  echo KITTY ALREADY INSTALLED
fi

if ! [ -x "$(command -v gnome-keyring)" ]; then
  echo INSTALLING KEYRING
  installGnomeKeyring
else
  echo KEYRING ALREADY INSTALLED
fi

if ! [ -x "$(command -v fzf)" ]; then
  echo INSTALLING FZF
  installFzf
else
  echo FZF ALREADY INSTALLED
fi

if ! [ -x "$(command -v rg)" ]; then
  echo INSTALLING RG
  installRg
else
  echo RG ALREADY INSTALLED
fi

if ! [ -x "$(command -v fd)" ]; then
  echo INSTALLING FD
  installFd
else
  echo FD ALREADY INSTALLED
fi

if ! [ -x "$(command -v ranger)" ]; then
  echo INSTALLING RANGER
  installRanger
else
  echo RANGER ALREADY INSTALLED
fi

if ! [ -x "$(command -v udiskie)" ]; then
  echo INSTALLING UDISKIE
  installUdiskie
else
  echo UDISKIE ALREADY INSTALLED
fi

if ! [ -x "$(command -v procs)" ]; then
  echo INSTALLING PROCS
  installProcs
else
  echo PROCS ALREADY INSTALLED
fi

if ! [ -x "$(command -v btm)" ]; then
  echo INSTALLING BTM
  installBtm
else
  echo BTM ALREADY INSTALLED
fi

if ! [ -x "$(command -v navi)" ]; then
  echo INSTALLING NAVI
  installNavi
else
  echo NAVI ALREADY INSTALLED
fi

if ! [ -x "$(command -v openfortivpn)" ]; then
  echo INSTALLING OPENFORTIVPN
  installOpenfortivpn
else
  echo OPENFORTIVPN ALREADY INSTALLED
fi

if ! [ -x "$(command -v tldr)" ]; then
  echo INSTALLING TLDR
  installTldr
else
  echo TLDR ALREADY INSTALLED
fi

if ! [ -x "$(command -v dropbox)" ]; then
  echo INSTALLING DROPBOX
  installDropbox
else
  echo DROPBOX ALREADY INSTALLED
fi

if ! [ -x "$(command -v flameshot)" ]; then
  echo INSTALLING FLAMESHOT
  installFlameshot
else
  echo FLAMESHOT ALREADY INSTALLED
fi

if ! [ -x "$(command -v steam)" ]; then
  echo INSTALLING STEAM
  installSteam
else
  echo STEAM ALREADY INSTALLED
fi

if ! [ -x "$(command -v pipewire)" ]; then
  echo INSTALLING PIPEWIRE
  installPipewire
else
  echo PIPEWIRE ALREADY INSTALLED
fi

if [ ! -f ~/.config/systemd/user/imwheel.service ]; then
  echo INSTALLING IMWHEEL
  installImwheel
else
  echo IMWHEEL ALREADY CONFIGURED
fi

if ! [ -x "$(command -v zathura)" ]; then
  echo INSTALLING ZATHURA
  installZathura
else
  echo ZATHURA ALREADY CONFIGURED
fi

if ! [ -x "$(command -v cups)" ]; then
  echo "INSTALLING CUPS (printer driver)"
  installCups
else
  echo CUPS ALREADY CONFIGURED
fi

echo '# CONFIGURATIONS'

if [ ! -f ~/.ssh/id_rsa.pub ]; then
  echo CONFIGURING SSH
  configureSsh
else
  echo SSH ALREADY CONFIGURED
fi

if [ ! -f ~/.zshrc ]; then
  echo CONFIGURING ZSH
  configureZsh
else
  echo ZSH ALREADY CONFIGURED
fi

if [ ! -d ~/.config/fontconfig/conf.d ]; then
  echo CONFIGURING SHARP FONTS
  configureFonts
else
  echo SHARP FONTS ALREADY CONFIGURED
fi

rm -rf $TEMP_DIR

echo Purged temp folder

echo REMEMBER TO:
echo - update all packages and the system
echo - register ssh public key to github
echo - install node with nvm
echo '- disable alt+space shortcut (https://unix.stackexchange.com/questions/44643/change-global-keyboard-shortcuts)'
echo '-remember to configure keyring (https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method)'
echo '-remember to configure nvidia hook (https://wiki.archlinux.org/title/NVIDIA#pacman_hook)'
echo - reboot
