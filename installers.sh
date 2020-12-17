## GLOBAL SOFTWARE

function installBaseDevel {
  case $DISTRO in
    ARCH)
      yay -S --noconfirm base-devel
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installYay {
  case $DISTRO in
    ARCH)
      git clone https://aur.archlinux.org/yay.git
      cd yay && makepkg -si --noconfirm && cd ..
      rm -rf yay
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
    ARCH)
      yay -S --noconfirm curl
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installWget {
  case $DISTRO in
    ARCH)
      yay -S --noconfirm wget
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
    ARCH)
      yay -S --noconfirm git
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installSsh {

  case $DISTRO in
    ARCH)
      yay -S --noconfirm openssh
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installRsync {

  case $DISTRO in
    ARCH)
      yay -S --noconfirm rsync
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installUnzip {

  case $DISTRO in
    ARCH)
      yay -S --noconfirm unzip
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

function installFontAwesome {
  # wget https://github.com/FortAwesome/Font-Awesome/releases/download/$FONTAWESOME_VERSION/fontawesome-free-$FONTAWESOME_VERSION-desktop.zip -O $TEMP_DIR/FontAwesome.zip

  # unzip $TEMP_DIR/FontAwesome.zip -d ~/.fonts

  # fc-cache
  echo MANUALLY INSTALL FONTAWESOME 5 PRO!
}

function installLsd {
  case $DISTRO in
    ARCH)
      yay -Sy --noconfirm lsd
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installBat {
  case $DISTRO in
    ARCH)
      yay -Sy --noconfirm bat
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installZsh {

  case $DISTRO in
    UBUNTU)
      apt-get update > /dev/null
      apt-get -y install zsh

      chmod a+x /usr/bin/chsh
      chsh -s $(which zsh)
    ;;
    ARCH)
      yay -Sy --noconfirm zsh
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
  git clone https://github.com/Aloxaf/fzf-tab ~ZSH_CUSTOM/plugins/fzf-tab

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
    ARCH)
      yay -S --noconfirm google-chrome
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installJetbrainsToolbox {
  case $DISTRO in
    UBUNTU)
      wget https://download.jetbrains.com/toolbox/$JETBRAINS_TOOLBOX.tar.gz -q --show-progress
      tar xvzf $JETBRAINS_TOOLBOX.tar.gz > /dev/null
      ./$JETBRAINS_TOOLBOX/jetbrains-toolbox
    ;;
    ARCH)
      yay -S --noconfirm fuse 
      
      wget https://download.jetbrains.com/toolbox/$JETBRAINS_TOOLBOX.tar.gz -q --show-progress
      tar xvzf $JETBRAINS_TOOLBOX.tar.gz > /dev/null
      ./$JETBRAINS_TOOLBOX/jetbrains-toolbox
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
    ARCH)
      yay -S --noconfirm telegram-desktop
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
    ARCH)
      yay -S --noconfirm xclip
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installSublimeMerge {
  curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo yay-key --add sublimehq-pub.gpg && sudo yay-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
  echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/yay.conf
  yay -Sy --noconfirm sublime-merge
}

function installDotnetSdk {
  yay -Sy --noconfirm dotnet-runtime
}

function installNode {
  yay -Sy --noconfirm nvm
}

function installYarn {
  yay -Sy --noconfirm yarn
}

function installDocker {
  yay -Sy --noconfirm docker
  
  $DOCKER_GROUP = docker
  getent group $DOCKER_GROUP || sudo groupadd $DOCKER_GROUP
  sudo usermod -aG $DOCKER_GROUP $USER
  # newgrp docker
  sudo systemctl enable docker
  sudo systemctl start docker
}

function installDockerCompose {
  yay -Sy --noconfirm docker-compose
}

function installTeams {
  yay -Sy --noconfirm teams
}

function installKubectl {
  yay -Sy --noconfirm kubectl-bin
}

function installSlack {
  yay -Sy --noconfirm slack-desktop
}

function installNVim {
  yay -Sy --noconfirm neovim-nightly
}

function installI3 {
  yay -Sy --noconfirm i3-wm
  yay -Sy --noconfirm i3lock
  yay -Sy --noconfirm i3-easyfocus

  # used for overall opacity
  yay -Sy --noconfirm picom
  # status bar
  yay -Sy --noconfirm polybar
  # launcher
  yay -Sy --noconfirm rofi
  # clipboard manager
  yay -Sy --noconfirm rofi-greenclip
  systemctl --user enable greenclip.service
  # background
  yay -Sy --noconfirm feh
  yay -Sy --noconfirm i3-battery-popup-git
}

function installDunst {
  yay -Sy --noconfirm dunst
}

function installKitty {
  yay -Sy --noconfirm kitty
}

function installFzf {
  yay -Sy --noconfirm fzf

  git clone https://github.com/Aloxaf/fzf-tab ~ZSH_CUSTOM/plugins/fzf-tab
}

function installRanger {
  yay -Sy --noconfirm ranger

  # image preview for range
  yay -Sy --noconfirm ueberzug

  git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
}

function installRg {
  yay -Sy --noconfirm ripgrep
}

function installFd {
  yay -Sy --noconfirm fd
}

## CONFIGURATION

function configureSsh {
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -C $EMAIL -P ""
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
}
