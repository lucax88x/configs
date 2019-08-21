## HELPERS


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

function installCurl() {
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

## SYSTEM DEPENDENCIES
function installLib32Glibc {
    sudo pacman -S --noconfirm lib32-glibc
}

function installLibunique3 {
    git clone https://aur.archlinux.org/libunique3.git
    cd libunique3
    makepkg -s --noconfirm
    find libunique3-*.tar.xz | sudo xargs pacman -U --noconfirm
}

function installSystemDependencies {
    case $DISTRO in
        MANJARO)
            # if [ $(isManjaroPackageInstalled 'lib32-glibc') == 1 ]; then 
            #     echo INSTALLING LIB32-GLIBC
            #     installLib32Glibc
            # else
            #     echo LIB32-GLIBC ALREADY INSTALLED
            # fi          

            # if [ $(isManjaroPackageInstalled 'libunique3') == 1 ]; then 
            #     echo INSTALLING LIBUNIQUE3
            #     installLibunique3
            # else
            #     echo LIBUNIQUE3 ALREADY INSTALLED
            # fi
        ;;
        *)
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
    echo TELL NO TO CHANGE TO SHELL OR THE SCRIPT WILL ABORT!
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed '/\s*env\s\s*zsh\s*/d')" \

    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion
    git clone https://github.com/buonomo/yarn-completion ~/.oh-my-zsh/custom/plugins/yarn-completion
    mkdir -p ~/.oh-my-zsh/custom/plugins/auto-ls
    curl -L https://git.io/auto-ls > ~/.oh-my-zsh/custom/plugins/auto-ls/auto-ls.zsh
    
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel9k\/powerlevel9k"\nPOWERLEVEL9K_DISABLE_RPROMPT=false\nPOWERLEVEL9K_PROMPT_ON_NEWLINE=true\nPOWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="λ "\nPOWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""\nPOWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)\nPOWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(os_icon kubecontext load ram disk_usage battery status root_indicator dir_writable time)\nPOWERLEVEL9K_MODE="nerdfont-complete"/g' ~/.zshrc
    sed -i 's/plugins=(git)/plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-better-npm-completion yarn-completion)/g' ~/.zshrc
    
cat <<EOT >> ~/.zshrc
# aliases
alias c='xclip -selection clipboard'
alias v='xclip -o'

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias repo='f() { cd ~/repos/$1 };f'
EOT

    echo -e "\n# auto-ls\nAUTO_LS_COMMANDS=(ls)\n. ~/.oh-my-zsh/custom/plugins/auto-ls/auto-ls.zsh" >> ~/.zshrc        
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
    sudo snap install code --classic
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
            
cat <<EOT >> ~/.config/autostart/albert
[Desktop Entry]
Name=albert
Exec=albert
Type=Application
EOT
            
        ;;
        MANJARO)            
            # sudo pacman -S --noconfirm glibc
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
    echo echo -e "\n# zsh-bd\n. ~/.oh-my-zsh/custom/plugins/bd/bd.zsh" >> ~/.zshrc

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

## CONFIGURATION

function configureGit {        
    wget https://raw.githubusercontent.com/lucax88x/configs/master/.gitconfig -O ~/.gitconfig
    
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -C $EMAIL -P ""
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
}