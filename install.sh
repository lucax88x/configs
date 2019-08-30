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
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

echo '# UPGRADE SYSTEM #'

upgradeSystem

echo '# GLOBAL SOFTWARE #'

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

if ! [ -x "$(command -v telegram-desktop)" ]; then
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

echo '# CONFIGURATIONS'

if [ ! -f ~/.gitconfig ]; then
    echo CONFIGURING GIT
    configureGit
else
    echo GIT ALREADY CONFIGURED
fi


if [ ! -f ~/.config/autostart/albert ]; then
    echo CONFIGURING ALBERT AUTOSTART
    configureAlbertAutostart
else
    echo ALBERT AUTOSTART ALREADY CONFIGURED
fi

# rm -rf $TEMP_DIR

echo Purged temp folder

echo TODO:
echo - set rigths to updated config files
echo - install rider with jetbrains toolbox
echo - install extension sync of vscode by script
echo '- setup shortcuts (for terminal, etc)'

echo REMEMBER TO:
echo - register ssh public key to github
echo - install vscode settings by using extension 'setting sync'
echo - reboot