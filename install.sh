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
FIRACODE_VERSION=2
FONTAWESOME_VERSION=5.12.1
JETBRAINS_TOOLBOX=jetbrains-toolbox-1.14.5179

mkdir -p $TEMP_DIR
cd $TEMP_DIR

## HELPERS

echo '# GLOBAL SOFTWARE #'

if ! [ -x "$(command -v yay)" ]; then
  echo INSTALLING YAY
  installYay
else
  echo YAY ALREADY INSTALLED
fi

if ! [ -x "$(command -v curl)" ]; then
  echo INSTALLING CURL
  installCurl
else
  echo CURL ALREADY INSTALLED
fi

if ! [ -x "$(command -v git)" ]; then
  echo INSTALLING GIT
  installGit
else
  echo GIT ALREADY INSTALLED
fi

if ! [ -x "$(command -v git-flow)" ]; then
  echo INSTALLING GIT FLOW
  # installGitFlow
else
  echo GIT FLOW ALREADY INSTALLED
fi

echo '# SOFTWARE #'

if ! [ "$(fc-list | grep -c 'FiraCode')" -ge 1 ]; then
  echo INSTALLING FIRACODE
  installFiraCode
else
  echo FIRACODE ALREADY INSTALLED
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

if [ ! -d ~/.oh-my-zsh ]; then
  echo INSTALLING OH-MY-ZSH
  installOhMyZsh
else
  echo OH-MY-ZSH ALREADY INSTALLED
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

if ! [ -x "$(command -v i3)" ]; then
  echo INSTALLING I3
  installI3
else
  echo I3 ALREADY INSTALLED
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

echo '# CONFIGURATIONS'

if [ ! -f ~/.gitconfig ]; then
  echo CONFIGURING GIT
  configureGit
else
  echo GIT ALREADY CONFIGURED
fi

rm -rf $TEMP_DIR

echo Purged temp folder

echo REMEMBER TO:
echo - update all packages and the system
echo - register ssh public key to github
echo - install node with nvm
echo '- disable alt+space shortcut (https://unix.stackexchange.com/questions/44643/change-global-keyboard-shortcuts)'
echo '- sync dotfiles'
echo - reboot
