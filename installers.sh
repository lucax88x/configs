## GLOBAL SOFTWARE

function installBaseDevel {
  case $DISTRO in
    ARCH)
      paru -S --noconfirm base-devel
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installGo {
  case $DISTRO in
    ARCH)
      paru -S --noconfirm go
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installRust {
  case $DISTRO in
    ARCH)
      paru -S --noconfirm rustup
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installParu {
  case $DISTRO in
    ARCH)
      git clone https://aur.archlinux.org/paru.git
      cd paru && makepkg -si --noconfirm && cd ..
      rm -rf paru
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
      paru -S --noconfirm curl
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installWget {
  case $DISTRO in
    ARCH)
      paru -S --noconfirm wget
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
      paru -S --noconfirm git
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installSsh {

  case $DISTRO in
    ARCH)
      paru -S --noconfirm openssh
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installUnzip {

  case $DISTRO in
    ARCH)
      paru -S --noconfirm unzip
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}


## SOFTWARE ##

function installJetbrainsMono {
  wget https://github.com/JetBrains/JetBrainsMono/releases/download/v$JETBRAINS_MONO_VERSION/JetBrainsMono-$JETBRAINS_MONO_VERSION.zip -O $TEMP_DIR/JetBrainsMono.zip

  unzip $TEMP_DIR/JetBrainsMono.zip -d $TEMP_DIR/jetbrains-mono
  mkdir -p ~/.fonts/jetbrains-mono
  cp $TEMP_DIR/jetbrains-mono/fonts/ttf/* ~/.fonts/jetbrains-mono
  # remove no ligature fonts
  rm ~/.fonts/jetbrains-mono/*NL*

  fc-cache
}

function installRoboto {
  wget https://fonts.google.com/download?family=Roboto -O $TEMP_DIR/Roboto.zip

  unzip $TEMP_DIR/Roboto.zip -d $TEMP_DIR/roboto
  mkdir -p ~/.fonts/roboto
  cp $TEMP_DIR/roboto/Roboto-* ~/.fonts/roboto

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
      paru -Sy --noconfirm lsd
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installBat {
  case $DISTRO in
    ARCH)
      paru -Sy --noconfirm bat
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
      paru -Sy --noconfirm zsh
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
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
      paru -S --noconfirm google-chrome
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
      tar xvzf $JETBRAINS_TOOLBOX.tar.gz
      ./$JETBRAINS_TOOLBOX/jetbrains-toolbox
    ;;
    ARCH)
      paru -S --noconfirm fuse 
      
      wget https://download.jetbrains.com/toolbox/$JETBRAINS_TOOLBOX.tar.gz -q --show-progress
      tar xvzf $JETBRAINS_TOOLBOX.tar.gz
      ./$JETBRAINS_TOOLBOX/jetbrains-toolbox
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installFuraCode {
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v$NERDFONT_VERSION/FiraCode.zip -O $TEMP_DIR/FuraCode.zip

  unzip $TEMP_DIR/FuraCode.zip -d ~/.fonts/furacode

  fc-cache
}

function installTelegram {

  case $DISTRO in
    UBUNTU)
      add-apt-repository -y ppa:atareao/telegram
      apt-get update > /dev/null
      apt-get -y install telegram
    ;;
    ARCH)
      paru -S --noconfirm telegram-desktop
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
      paru -S --noconfirm xclip
    ;;
    *)
      echo NOT IMPLEMENTED!
    ;;
  esac
}

function installSublimeMerge {
  curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo yay-key --add sublimehq-pub.gpg && sudo yay-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
  echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/yay.conf
  paru -Sy --noconfirm sublime-merge
}

function installDotnetSdk {
  paru -Sy --noconfirm dotnet-runtime
}

function installNode {
  paru -Sy --noconfirm nvm
}

function installYarn {
  paru -Sy --noconfirm yarn
}

function installDocker {
  paru -Sy --noconfirm docker
  
  $DOCKER_GROUP = docker
  getent group $DOCKER_GROUP || sudo groupadd $DOCKER_GROUP
  sudo usermod -aG $DOCKER_GROUP $USER
  # newgrp docker
  sudo systemctl enable docker
  sudo systemctl start docker
}

function installDockerCompose {
  paru -Sy --noconfirm docker-compose
}

function installTeams {
  paru -Sy --noconfirm teams
}

function installKubectl {
  paru -Sy --noconfirm kubectl-bin
}

function installSlack {
  paru -Sy --noconfirm slack-desktop
}

function installNVim {
  paru -Sy --noconfirm neovim-nightly
}

function installI3 {
  paru -Sy --noconfirm i3-wm
  paru -Sy --noconfirm i3lock
  paru -Sy --noconfirm i3-easyfocus

  # used for overall opacity
  paru -Sy --noconfirm picom
  # status bar
  paru -Sy --noconfirm polybar
  # launcher
  paru -Sy --noconfirm rofi
  # clipboard manager
  paru -Sy --noconfirm rofi-greenclip
  systemctl --user enable greenclip.service
  # background
  paru -Sy --noconfirm feh
  paru -Sy --noconfirm i3-battery-popup-git
}

function installDunst {
  paru -Sy --noconfirm dbus
  
  paru -Sy --noconfirm dunst
}

function installKitty {
  paru -Sy --noconfirm kitty
}

function installGnomeKeyring {
  paru -Sy --noconfirm gnome-keyring
  paru -Sy --noconfirm libsecret
}

function installFzf {
  paru -Sy --noconfirm fzf

  git clone https://github.com/Aloxaf/fzf-tab ~ZSH_CUSTOM/plugins/fzf-tab
}

function installRanger {
  paru -Sy --noconfirm ranger

  # image preview for range
  paru -Sy --noconfirm ueberzug

  git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
}

function installRg {
  paru -Sy --noconfirm ripgrep
}

function installFd {
  paru -Sy --noconfirm fd
}

function installUdiskie {
  paru -Sy --noconfirm udiskie
}

function installProcs {
  paru -Sy --noconfirm procs
}

function installBtm {
  paru -S --noconfirm bottom 
}

function installNavi {
  paru -S --noconfirm navi 
}

function installBroot {
  paru -S --noconfirm broot 
}

function installOpenfortivpn {
  paru -S --noconfirm openfortivpn 
}

function installTldr {
  paru -S --noconfirm tldr 
}

function installDropbox {
  paru -S --noconfirm dropbox 
}

function installFlameshot {
  paru -S --noconfirm flameshot 
}

function installSteam {
  # https://wiki.archlinux.org/title/Steam#Installation
  
  paru -S --noconfirm steam
  paru -S --noconfirm nvidia nvidia-utils lib32-nvidia-utils
  paru -S --noconfirm wine giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
}

## CONFIGURATION

function configureSsh {
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -C $EMAIL -P ""
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
}

function configureZsh {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"}
}

