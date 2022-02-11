#!/bin/bash

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
		apt-get update >/dev/null
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
		apt-get update >/dev/null
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

function installOpenSans {
	wget https://fonts.google.com/download?family=Open+Sans -O $TEMP_DIR/OpenSans.zip

	unzip $TEMP_DIR/OpenSans.zip -d $TEMP_DIR/open-sans
	mkdir -p ~/.fonts/open-sans
	cp $TEMP_DIR/roboto/OpenSans-* ~/.fonts/open-sans

	fc-cache
}

function installFreeType {
	paru -Sy --noconfirm freetype2-ultimate5
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
		apt-get update >/dev/null
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
		apt-get update >/dev/null
		apt-get -y install google-chrome-stable
		;;
	ARCH)
		paru -S --noconfirm google-chrome

		# enables hardware accelerated
		paru -S --noconfirm libvdpau vdpauinfo
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
		apt-get update >/dev/null
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
	curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh >~/.oh-my-zsh/custom/plugins/bd/bd.zsh
	echo -e "\n# zsh-bd\n. ~/.oh-my-zsh/custom/plugins/bd/bd.zsh" >>~/.zshrc
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
	paru -Sy --noconfirm dotnet-sdk-bin
	paru -Sy --noconfirm aspnet-runtime-bin
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
	# background
	paru -Sy --noconfirm feh
	paru -Sy --noconfirm i3-battery-popup-git
}

function installRofi {
	# launcher
	paru -Sy --noconfirm rofi

	# clipboard manager
	paru -Sy --noconfirm rofi-greenclip
	systemctl --user enable greenclip.service
	systemctl --user start greenclip.service

	# bluetooth
	paru -S --noconfirm rofi-bluetooth-git
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

function installBtop {
	paru -S --noconfirm btop
}

function installNavi {
	paru -S --noconfirm navi
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

	## remember to enable multilib
	paru -S --noconfirm steam steam-fonts
	paru -S --noconfirm mangohud
	paru -S --noconfirm nvidia nvidia-utils lib32-nvidia-utils

	paru -S --noconfirm nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
	paru -S --noconfirm giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
	# paru -S --noconfirm dxvk-bin

	## for battlenet!
	paru -S --noconfirm lutris-git

	paru -S --noconfirm protonup-git
	protonup -d "~/.steam/root/compatibilitytools.d/"
}

function installPipewire {
	paru -S --noconfirm pipewire pipewire-pulse pipewire-alsa
	sudo systemctl status bluetooth.service

	# bluetooth
	paru -S --noconfirm bluez bluez-utils
}

function installImwheel {
	paru -S --noconfirm imwheel

	sudo tee ~/.config/systemd/user/imwheel.service >/dev/null <<EOT
  [Unit]
  Description=IMWheel
  Wants=display-manager.service
  After=display-manager.service

  [Service]
  Type=simple
  Environment=XAUTHORITY=%h/.Xauthority
  ExecStart=/usr/bin/imwheel -d -b 45
  ExecStop=/usr/bin/pkill imwheel
  RemainAfterExit=yes

  [Install]
  WantedBy=default.target
EOT

	systemctl --user daemon-reload
	systemctl --user enable --now imwheel.service
	systemctl --user start --now imwheel.service
	journalctl --user --unit imwheel.service
}

function installZathura {
	paru -S --noconfirm zathura-git zathura-pdf-poppler-git
}

function installCups {
	paru -S --noconfirm cups cups-pdf system-config-printer
	paru -S --noconfirm samsung-unified-driver

	systemctl enable --now cups.service
	systemctl start --now cups.service
}

function installTplinkWifi {
	paru -S --noconfirm rtl88x2bu-dkms-git
	sudo modprobe 88x2bu
}

function installNordvpn {
	paru -S --noconfirm nordvpn-bin
	sudo systemctl enable nordvpnd.service
	sudo systemctl start nordvpnd.service
	sudo usermod -aG nordvpn "$USER"
}

function installForticlient {
	paru -S --noconfirm forticlient-vpn
	sudo systemctl enable forticlient-scheduler
	sudo systemctl start forticlient-scheduler
}

function installVirtualization {
	paru -S --noconfirm qemu virt-manager qemu-arch-extra ovmf vde2 ebtables dnsmasq bridge-utils openbsd-netcat dmidecode
	sudo systemctl enable libvirtd.service
	sudo systemctl start libvirtd.service

	sudo virsh net-start default
	sudo virsh net-autostart default

	sudo usermod -aG libvirt "$USER"
	# sudo usermod -aG libvirt-qemu "$USER"
	# https://leduccc.medium.com/improving-the-performance-of-a-windows-10-guest-on-qemu-a5b3f54d9cf5
}

function installThermald {
	paru -S --noconfirm thermald
	sudo systemctl enable --now thermald
	sudo systemctl start --now thermald
}

## CONFIGURATION

function configureSsh {
	ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "$EMAIL" -P ""
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
}

function configureZsh {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
}

function configureFonts {
	mkdir -p ~/.config/fontconfig/conf.d
	ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf ~/.config/fontconfig/conf.d/
}
