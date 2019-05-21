mkdir -p ~/setup-temp
mkdir -p ~/.config/autostart
cd ~/setup-temp

EMAIL=lucax88x@gmail.com
UBUNTU_VERSION=19.04
JETBRAINS_TOOLBOX=jetbrains-toolbox-1.14.5179

echo "this installer is for $UBUNTU_VERSION"

if ! [ -x "$(command -v curl)" ]; then
    echo INSTALLING CURL
    apt-get update > /dev/null
    apt-get -y install curl
else
    echo CURL ALREADY INSTALLED
fi

if ! [ -x "$(command -v git)" ]; then
    echo INSTALLING GIT
    apt-get update > /dev/null
    apt-get -y install git-core
    
    wget https://raw.githubusercontent.com/lucax88x/configs/master/.gitconfig -O ~/.gitconfig
    
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -C $EMAIL -P ""
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
else
    echo GIT ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'firacode')" -ge 1 ]; then
    echo INSTALLING FIRACODE
    apt install fonts-firacode
else
    echo FIRACODE ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'NerdFonts')" -ge 1 ]; then
    echo INSTALLING NERDFONTS
    
	git clone https://github.com/ryanoasis/nerd-fonts.git ~/setup-temp/nerd-fonts

	~/setup-temp/nerd-fonts/install.sh
    
else
    echo NERDFONTS ALREADY INSTALLED
fi

# if ! [ "$(fc-list | grep -c 'PowerlineSymbols')" -ge 1 ]; then
#     echo INSTALLING POWERLINE
    
#     wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
#     wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    
#     mkdir -p ~/.local/share/fonts/
#     mv PowerlineSymbols.otf ~/.local/share/fonts/
#     fc-cache -vf ~/.local/share/fonts/
#     mkdir -p ~/.config/fontconfig/conf.d
#     mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
    
# else
#     echo POWERLINE ALREADY INSTALLED
# fi

if ! [ -x "$(command -v lsd)" ]; then
    echo INSTALLING LSD
    snap install lsd --devmode
else
    echo LSD ALREADY INSTALLED
fi

if ! [ -x "$(command -v zsh)" ]; then
    echo INSTALLING ZSH WITH OH-MY-ZSH
    apt-get update > /dev/null
    apt-get -y install zsh
    
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed '/\s*env\s\s*zsh\s*/d')" \
    
    
    chmod a+x /usr/bin/chsh
    chsh -s $(which zsh)
    
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion
	git clone https://github.com/buonomo/yarn-completion ~/.oh-my-zsh/custom/plugins/yarn-completion
    
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel9k\/powerlevel9k"\nPOWERLEVEL9K_DISABLE_RPROMPT=false\nPOWERLEVEL9K_PROMPT_ON_NEWLINE=true\nPOWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="λ "\nPOWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""\nPOWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)\nPOWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(os_icon kubecontext load ram disk_usage battery status root_indicator dir_writable time)"\nPOWERLEVEL9K_MODE="nerdfont-complete"/g' ~/.zshrc
    sed -i 's/plugins=(git)/plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-better-npm-completion yarn-completion)/g' ~/.zshrc
    
cat <<EOT >> ~/.zshrc

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
    
    
else
    echo ZSH ALREADY INSTALLED
fi

if ! [ -x "$(command -v google-chrome)" ]; then
    echo INSTALLING CHROME
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
    sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    apt-get update > /dev/null
    apt-get -y install google-chrome-stable
else
    echo CHROME ALREADY INSTALLED
fi

if ! [ -x "$(command -v code)" ]; then
    echo INSTALLING VSCODE
    snap install code --classic
else
    echo VSCODE ALREADY INSTALLED
fi

if ! [ -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ]; then
    echo INSTALLING JETBRAINS TOOLBOX
    
    wget https://download.jetbrains.com/toolbox/$JETBRAINS_TOOLBOX.tar.gz -q --show-progress
    tar xvzf $JETBRAINS_TOOLBOX.tar.gz > /dev/null
    ./$JETBRAINS_TOOLBOX/jetbrains-toolbox
else
    echo JETBRAINS TOOLBOX ALREADY INSTALLED
fi

if ! [ -x "$(command -v albert)" ]; then
    echo INSTALLING ALBERT
    
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
    
else
    echo ALBERT ALREADY INSTALLED
fi

if [ $(dpkg-query -W -f='${Status}' telegram 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo INSTALLING TELEGRAM
    
    add-apt-repository -y ppa:atareao/telegram
    apt-get update > /dev/null
    apt-get -y install telegram
    
else
    echo TELEGRAM ALREADY INSTALLED
fi

if ! [ -x "$(command -v diodon)" ]; then
    echo INSTALLING DIODON
    
    add-apt-repository -y ppa:diodon-team/stable
    apt-get update > /dev/null
    apt-get -y install diodon
    
else
    echo DIODON ALREADY INSTALLED
fi

if ! [ -x "$(command -v bd)" ]; then
    echo INSTALLING BD
    
    mkdir -p ~/.zsh/plugins/bd
    curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh > ~/.zsh/plugins/bd/bd.zsh
    print -- "\n# zsh-bd\n. ~/.zsh/plugins/bd/bd.zsh" >> ~/.zshrc
    
else
    echo BD ALREADY INSTALLED
fi

if ! [ -x "$(command -v xclip)" ]; then
    echo INSTALLING XCLIP
    apt-get -y install xclip
else
    echo XCLIP ALREADY INSTALLED
fi


#rm -rf ~/setup-temp

echo Purged temp folder

# add auto-ls

echo REMEMBER TO:
echo - register ssh public key to github
echo - set terminal to dark and to use firacode
echo - install vscode settings by using extension 'setting sync'