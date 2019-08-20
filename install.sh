#!/bin/bash
. installers.sh

DISTRO=${1^^}

case $DISTRO in
	UBUNTU)
		echo installing for ubuntu
	;;
	MANJARO)
		echo installing for manjaro
	;;
	*)
		echo not supported distro
	exit 1
	;;
esac

TEMP_DIR=~/setup-temp
EMAIL=lucax88x@gmail.com
NERDFONT_VERSION=2.0.0
FIRACODE_VERSION=1.206
JETBRAINS_TOOLBOX=jetbrains-toolbox-1.14.5179

mkdir -p $TEMP_DIR
mkdir -p ~/.config/autostart
cd $TEMP_DIR

## HELPERS

function isManjaroPackageInstalled() {
  pacman -Qi "$packageName" &> /dev/null
  echo $?
}

## GLOBAL SOFTWARE

if ! [ -x "$(command -v snap)" ]; then
    echo INSTALLING SNAP
    installSnap
else
    echo SNAP ALREADY INSTALLED
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

## SYSTEM DEPENDENCIES

installSystemDependencies

## SOFTWARE

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

if ! [ -x "$(command -v gnome-tweaks)" ]; then
    echo INSTALLING GNOME-TWEAKS-TOOL
    installGnomeTweaks
else
    echo GNOME-TWEAKS-TOOL ALREADY INSTALLED
fi

if ! [ -x "$(command -v lsd)" ]; then
    echo INSTALLING LSD
    installLsd
else
    echo LSD ALREADY INSTALLED
fi

if ! [ -x "$(command -v zsh)" ]; then
    echo INSTALLING ZSH WITH OH-MY-ZSH
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

if ! [ -x "$(command -v code)" ]; then
    echo INSTALLING VSCODE
    installVsCode
else
    echo VSCODE ALREADY INSTALLED
fi

if ! [ -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ]; then
    echo INSTALLING JETBRAINS TOOLBOX
    installJetbrainsToolbox
else
    echo JETBRAINS TOOLBOX ALREADY INSTALLED
fi

if ! [ -x "$(command -v albert)" ]; then
    echo INSTALLING ALBERT
    installAlbert
else
    echo ALBERT ALREADY INSTALLED
fi

if [ $(dpkg-query -W -f='${Status}' telegram 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo INSTALLING TELEGRAM
    installTelegram
else
    echo TELEGRAM ALREADY INSTALLED
fi

if ! [ -x "$(command -v diodon)" ]; then
    echo INSTALLING DIODON
    installDiodon
else
    echo DIODON ALREADY INSTALLED
fi

if ! [ -x "$(command -v bd)" ]; then
    echo INSTALLING BD
    installBd
else
    echo BD ALREADY INSTALLED
fi

if ! [ -x "$(command -v xclip)" ]; then
    echo INSTALLING xclip
    installXClip
else
    echo XCLIP ALREADY INSTALLED
fi


# rm -rf $TEMP_DIR

echo Purged temp folder

echo TODO:
echo - SET SSH for github
echo - set rigths to updated config files
echo - install rider with jetbrains toolbox
echo - install extension sync of vscode by script
echo '- setup shortcuts (for terminal, etc)'

echo REMEMBER TO:
echo - register ssh public key to github
echo - run gnome-tweaks and set system font with FuraCode Regular
echo - set terminal to dark theme
echo - install vscode settings by using extension 'setting sync'
echo - reboot!
