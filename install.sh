mkdir -p ~/setup-temp
cd ~/setup-temp

if ! [ -x "$(command -v git)" ]; then
	echo INSTALLING GIT
	apt-get update
	apt-get -y install git-core

	wget https://raw.githubusercontent.com/lucax88x/configs/master/.gitconfig -O ~/.gitconfig
else
	echo GIT ALREADY INSTALLED
fi

if ! [ -x "$(command -v zsh)" ]; then
	echo INSTALLING ZSH WITH OH-MY-ZSH
	apt-get update
	apt-get -y install zsh
	
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

	chsh -s $(which zsh)

	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

	# sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel9k/powerlevel9k"/g' ~/.zshrc		

    # ZSH_THEME="powerlevel9k/powerlevel9k"
    # POWERLEVEL9K_DISABLE_RPROMPT=true
    # POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    # POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="λ "
    # POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
    # POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
    # POWERLEVEL9K_DISABLE_RPROMPT=false
    # POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
    # POWERLEVEL9K_MODE='nerdfont-complete'

    # plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-better-npm-completion yarn-completion)

    # alias c='xclip -selection clipboard'
    # alias v='xclip -o'

    # alias ls='lsd'
    # alias l='ls -l'
    # alias la='ls -a'
    # alias lla='ls -la'
    # alias lt='ls --tree'
    # alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
    # alias repo='f() { cd ~/repos/$1 };f'

else
	echo ZSH ALREADY INSTALLED
fi

if ! [ -x "$(command -v google-chrome)" ]; then
	echo INSTALLING CHROME
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
	sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	apt-get update
	apt-get -y install google-chrome-stable
else
	echo CHROME ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'firacode')" -ge 1 ]; then
	echo INSTALLING FIRACODE
	apt install fonts-firacode
else
	echo FIRACODE ALREADY INSTALLED
fi

if ! [ -x "$(command -v code)" ]; then
	echo INSTALLING VSCODE
	snap install code --classic
else
	echo VSCODE ALREADY INSTALLED
fi

if ! [ -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ]; then
	echo INSTALLING JETBRAINS TOOLBOX

	#NAME=jetbrains-toolbox-1.14.5179
	#wget https://download.jetbrains.com/toolbox/$NAME.tar.gz -q --show-progress
	#tar xvzf $NAME.tar.gz>/dev/null
	#./$NAME/jetbrains-toolbox>/dev/null
else
	echo JETBRAINS TOOLBOX ALREADY INSTALLED
fi

if ! [ -x "$(command -v albert)" ]; then
	echo INSTALLING ALBERT

	curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | apt-key add -

	sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
	apt-get update
	apt-get -y install albert
else
	echo ALBERT ALREADY INSTALLED
fi

if [ $(dpkg-query -W -f='${Status}' telegram 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
	echo INSTALLING TELEGRAM

	add-apt-repository ppa:atareao/telegram
	apt-get update
	apt-get -y install telegram
	
else
	echo TELEGRAM ALREADY INSTALLED
fi

if ! [ -x "$(command -v diodon)" ]; then
	echo INSTALLING DIODON

	add-apt-repository ppa:diodon-team/stable
	apt-get update
	apt-get -y install diodon
	
else
	echo DIODON ALREADY INSTALLED
fi

cd ~

#rm -rf ~/setup-temp

echo Purged temp folder

# LS extend
# ZSH
# ditto
# telegram
# add g as alias to zshrc
# auto start apps, albert, diodon