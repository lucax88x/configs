## SYSTEM UPGRADE

function upgradeSystem {
    case $DISTRO in
        MANJARO)
            sudo pacman -Syyu --noconfirm
        ;;
        *)
        ;;
    esac
}

## GLOBAL SOFTWARE

function installSnap {
    
    case $DISTRO in
        MANJARO)
            sudo pacman -Sy --noconfirm snapd
            sudo systemctl enable --now snapd.socket
            
            echo Either log out and back in again, or restart your system, to ensure snap’s paths are updated correctly.
            echo Once done, restart the script!
            
            exit 1
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installCurl {
    case $DISTRO in
        UBUNTU)
            apt-get update > /dev/null
            apt-get -y install curl
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installGit {
    
    case $DISTRO in
        UBUNTU)
            apt-get update > /dev/null
            apt-get -y install git-core
        ;;
        MANJARO)
            sudo pacman -S --noconfirm git
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

## SOFTWARE ##

function installFiraCode {
    wget https://github.com/tonsky/FiraCode/releases/download/$FIRACODE_VERSION/FiraCode_$FIRACODE_VERSION.zip -O $TEMP_DIR/FiraCode.zip
    
    unzip $TEMP_DIR/FiraCode.zip -d ~/.fonts
    
    fc-cache
}

function installFuraCode {
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v$NERDFONT_VERSION/FiraCode.zip -O $TEMP_DIR/FuraCode.zip
    
    unzip $TEMP_DIR/FuraCode.zip -d ~/.fonts
    
    fc-cache
}

function installGnomeTweaks {
    
    case $DISTRO in
        UBUNTU)
            add-apt-repository universe
            apt -y install gnome-tweak-tool
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installLsd {
    sudo snap install lsd --devmode
}

function installZsh {
    
    case $DISTRO in
        UBUNTU)
            apt-get update > /dev/null
            apt-get -y install zsh
            
            chmod a+x /usr/bin/chsh
            chsh -s $(which zsh)
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installOhMyZsh {
    # echo TELL YES TO CHANGE TO SHELL AND THEN EXIT!
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed '/\s*env\s\s*zsh\s*/d')"
    
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion
    git clone https://github.com/buonomo/yarn-completion ~/.oh-my-zsh/custom/plugins/yarn-completion
    
    wget https://raw.githubusercontent.com/lucax88x/configs/master/.p10k.zsh -O ~/.p10k.zsh
    wget https://raw.githubusercontent.com/lucax88x/configs/master/.zshrc -O ~/.zshrc
}

function installChrome {
    
    case $DISTRO in
        UBUNTU)
            wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
            sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
            apt-get update > /dev/null
            apt-get -y install google-chrome-stable
        ;;
        MANJARO)
            git clone https://aur.archlinux.org/google-chrome.git
            cd google-chrome
            makepkg -s --noconfirm
            find google-chrome-*.tar.xz | sudo xargs pacman -U --noconfirm
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installVsCode {
    case $DISTRO in
        UBUNTU)
            sudo snap install code --classic
            
        ;;
        MANJARO)
            sudo pacman -S --noconfirm code
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installJetbrainsToolbox {
    wget https://download.jetbrains.com/toolbox/$JETBRAINS_TOOLBOX.tar.gz -q --show-progress
    tar xvzf $JETBRAINS_TOOLBOX.tar.gz > /dev/null
    ./$JETBRAINS_TOOLBOX/jetbrains-toolbox
}

function installAlbert {
    
    case $DISTRO in
        UBUNTU)
            curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | apt-key add -
            
            sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_$UBUNTU_VERSION/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
            apt-get update > /dev/null
            apt-get -y install albert
            
        ;;
        MANJARO)
            sudo pacman -S --noconfirm albert
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installTelegram {
    
    case $DISTRO in
        UBUNTU)
            add-apt-repository -y ppa:atareao/telegram
            apt-get update > /dev/null
            apt-get -y install telegram
        ;;
        MANJARO)
            sudo pacman -S --noconfirm telegram-desktop
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installDiodon {
    
    case $DISTRO in
        UBUNTU)
            add-apt-repository -y ppa:diodon-team/stable
            apt-get update > /dev/null
            apt-get -y install diodon
        ;;
        MANJARO)
            echo NOT SUPPORTED!
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installBd {
    mkdir -p ~/.oh-my-zsh/custom/plugins/bd
    curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh > ~/.oh-my-zsh/custom/plugins/bd/bd.zsh
    echo -e "\n# zsh-bd\n. ~/.oh-my-zsh/custom/plugins/bd/bd.zsh" >> ~/.zshrc
}

function installXClip {
    
    case $DISTRO in
        UBUNTU)
            apt-get -y install xclip
        ;;
        MANJARO)
            sudo pacman -S --noconfirm xclip
        ;;
        *)
            echo NOT IMPLEMENTED!
        ;;
    esac
}

function installSublimeMerge {
    curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
    echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
    sudo pacman -Sy --noconfirm sublime-merge
}

function installDotnetSdk {
    sudo pacman -Sy --noconfirm dotnet-sdk

    wget https://dot.net/v1/dotnet-install.sh -O $TEMP_DIR/dotnet-install.sh
    sudo $TEMP_DIR/dotnet-install.sh --install-dir /opt/dotnet -channel Current -version latest
}

function installNode {
    sudo pacman -Sy --noconfirm nodejs
    sudo pacman -Sy --noconfirm npm
}

function installYarn {
    sudo pacman -Sy --noconfirm yarn
}

function installDocker {
    sudo pacman -Sy --noconfirm docker
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    sudo systemctl enable docker
    sudo systemctl start docker
}

function installDockerCompose {
    sudo pacman -Sy --noconfirm docker-compose
}

function installTeams {
    sudo snap install teams-for-linux
}

function installKubectl {
    sudo snap install kubectl --classic
}

function installSlack {
    sudo snap install slack --classic
}

function installEmacs {
    sudo snap install emacs --classic
    git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
}

function installI3 {
    sudo pacman -S i3-wm
    sudo pacman -S i3lock
    sudo pacman -S polybar
    
    mkdir -p ~/.config/i3
    mkdir -p ~/.config/polybar

    wget https://raw.githubusercontent.com/lucax88x/configs/master/i3/config -O ~/.config/i3/config
    wget https://raw.githubusercontent.com/lucax88x/configs/master/i3/polybar/launch.sh -O ~/.config/polybar/launch.sh
    wget https://raw.githubusercontent.com/lucax88x/configs/master/i3/polybar/config -O ~/.config/polybar/config
    wget https://raw.githubusercontent.com/lucax88x/configs/master/i3/rofi/config.rasi -O ~/.config/rofi/config.rasi

    chmod +x ~/.config/polybar/launch.sh
}

function installRofi {
    sudo pacman -S rofi
}

## CONFIGURATION

function configureGit {
    wget https://raw.githubusercontent.com/lucax88x/configs/master/.gitconfig -O ~/.gitconfig
    
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -C $EMAIL -P ""
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
}

function configureAlbertAutostart {
    
cat <<EOT >> ~/.config/autostart/albert.desktop
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=Albert
Comment=
Exec=albert
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false
EOT
}

function configureCapsLockToCtrl {
    # - https://forum.manjaro.org/t/remap-capslock-to-control/57705
    sudo sed -i 's/EndSection/        Option "XkbOptions" " ctrl:nocaps"\r\nEndSection/g' /etc/X11/xorg.conf.d/00-keyboard.conf
}
