#!/bin/bash
DISTRO=${1^^}

case $DISTRO in
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

mkdir -p $TEMP_DIR
cd $TEMP_DIR || exit

echo '# GLOBAL SOFTWARE #'

if ! [ -x "$(command -v paru)" ]; then
	echo INSTALLING PARU

	git clone https://aur.archlinux.org/paru.git
	cd paru && makepkg -si --noconfirm && cd ..
	rm -rf paru
else
	echo PARU ALREADY INSTALLED
fi

if ! [ -x "$(command -v make)" ]; then
	echo INSTALLING BASE-DEVEL

	paru -S --noconfirm base-devel
else
	echo BASE-DEVEL ALREADY INSTALLED
fi

if ! [ -x "$(command -v rustup)" ]; then
	echo INSTALLING RUSTUP

	paru -S --noconfirm rustup
else
	echo RUST ALREADY INSTALLED
fi

if ! [ -x "$(command -v go)" ]; then
	echo INSTALLING GO

	paru -S --noconfirm go
else
	echo GO ALREADY INSTALLED
fi

if ! [ -x "$(command -v git)" ]; then
	echo INSTALLING GIT

	paru -S --noconfirm git
else
	echo GIT ALREADY INSTALLED
fi

if ! [ -x "$(command -v wget)" ]; then
	echo INSTALLING WGET

	paru -S --noconfirm wget
else
	echo WGET ALREADY INSTALLED
fi

if ! [ -x "$(command -v curl)" ]; then
	echo INSTALLING CURL

	paru -S --noconfirm curl
else
	echo CURL ALREADY INSTALLED
fi

if ! [ -x "$(command -v ssh-keygen)" ]; then
	echo INSTALLING SSH

	paru -S --noconfirm openssh
else
	echo SSH ALREADY INSTALLED
fi

if ! [ -x "$(command -v unzip)" ]; then
	echo INSTALLING UNZIP

	paru -S --noconfirm unzip
else
	echo UNZIP ALREADY INSTALLED
fi

echo '# SOFTWARE #'

if ! [ "$(fc-list | grep -c 'JetBrains')" -ge 1 ]; then
	echo INSTALLING JETBRAINS MONO

	paru -S --noconfirm nerd-fonts-jetbrains-mono
	paru -S --noconfirm ttf-jetbrains-mono-git
else
	echo JETBRAINS MONO ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'Open Sans')" -ge 1 ]; then
	echo INSTALLING OPEN SANS

	wget https://fonts.google.com/download?family=Open+Sans -O $TEMP_DIR/OpenSans.zip

	unzip $TEMP_DIR/OpenSans.zip -d $TEMP_DIR/open-sans
	mkdir -p ~/.fonts/open-sans
	cp -r $TEMP_DIR/open-sans/* ~/.fonts/open-sans

	fc-cache
else
	echo OPEN SANS ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'Roboto')" -ge 1 ]; then
	echo INSTALLING ROBOTO

	wget https://fonts.google.com/download?family=Roboto -O $TEMP_DIR/Roboto.zip

	unzip $TEMP_DIR/Roboto.zip -d $TEMP_DIR/roboto
	mkdir -p ~/.fonts/roboto
	cp -r $TEMP_DIR/roboto/* ~/.fonts/roboto

	fc-cache
else
	echo ROBOTO ALREADY INSTALLED
fi

if ! [ "$(fc-list | grep -c 'Font Awesome 5 Free')" -ge 1 ]; then
	echo INSTALLING FONTAWESOME

	# wget https://github.com/FortAwesome/Font-Awesome/releases/download/$FONTAWESOME_VERSION/fontawesome-free-$FONTAWESOME_VERSION-desktop.zip -O $TEMP_DIR/FontAwesome.zip

	# unzip $TEMP_DIR/FontAwesome.zip -d ~/.fonts/fontawesome5

	# fc-cache
	echo MANUALLY INSTALL FONTAWESOME 5 PRO!
else
	echo FONTAWESOME ALREADY INSTALLED
fi

if ! [ "pacman -Qs freetype2-ultimate5 > /dev/null" ]; then
	echo INSTALLING FREETYPE PATCHED

	paru -Sy --noconfirm freetype2-ultimate5
else
	echo PATCHED FREETYPE ALREADY INSTALLED
fi

if ! [ -x "$(command -v bat)" ]; then
	echo INSTALLING BAT

	paru -Sy --noconfirm bat
else
	echo BAT ALREADY INSTALLED
fi

if ! [ -x "$(command -v lsd)" ]; then
	echo INSTALLING LSD

	paru -Sy --noconfirm lsd
else
	echo LSD ALREADY INSTALLED
fi

if ! [ -x "$(command -v zsh)" ]; then
	echo INSTALLING ZSH

	paru -Sy --noconfirm zsh
else
	echo ZSH ALREADY INSTALLED
fi

if ! [ -x "$(command -v google-chrome-stable)" ]; then
	echo INSTALLING CHROME

	paru -S --noconfirm google-chrome

	# enables hardware accelerated
	paru -S --noconfirm libvdpau vdpauinfo
else
	echo CHROME ALREADY INSTALLED
fi

if ! [ -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ]; then
	echo INSTALLING JETBRAINS TOOLBOX

	paru -S --noconfirm jetbrains-toolbox
else
	echo JETBRAINS TOOLBOX ALREADY INSTALLED
fi

if ! [ -x "$(command -v telegram-desktop)" ]; then
	echo INSTALLING TELEGRAM

	paru -S --noconfirm telegram-desktop
else
	echo TELEGRAM ALREADY INSTALLED
fi

if ! [ -x "$(command -v xclip)" ]; then
	echo INSTALLING XCLIP

	paru -S --noconfirm xclip
else
	echo XCLIP ALREADY INSTALLED
fi

if ! [ -x "$(command -v smerge)" ]; then
	echo INSTALLING SUBLIME MERGE

	curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo yay-key --add sublimehq-pub.gpg && sudo yay-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
	echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/yay.conf
	paru -Sy --noconfirm sublime-merge
else
	echo SUBLIME MERGE ALREADY INSTALLED
fi

if ! [ -x "$(command -v dotnet)" ]; then
	echo INSTALLING DOTNETCORE SDK

	paru -Sy --noconfirm dotnet-sdk-bin
	paru -Sy --noconfirm aspnet-runtime-bin
else
	echo DOTNETCORE SDK ALREADY INSTALLED
fi

if ! [ -x "$(command -v node)" ]; then
	echo INSTALLING NODE

	paru -Sy --noconfirm nvm
else
	echo NODE ALREADY INSTALLED
fi

if ! [ -x "$(command -v yarn)" ]; then
	echo INSTALLING YARN

	paru -Sy --noconfirm yarn
else
	echo YARN ALREADY INSTALLED
fi

if ! [ -x "$(command -v docker)" ]; then
	echo INSTALLING DOCKER

	paru -Sy --noconfirm docker

	DOCKER_GROUP=docker
	getent group $DOCKER_GROUP || sudo groupadd $DOCKER_GROUP
	sudo usermod -aG "$DOCKER_GROUP" "$USER"
	# newgrp docker
	sudo systemctl enable docker.socket
	sudo systemctl start docker.socket
else
	echo DOCKER ALREADY INSTALLED
fi

if ! [ -x "$(command -v docker-compose)" ]; then
	echo INSTALLING DOCKER-COMPOSE

	paru -Sy --noconfirm docker-compose
else
	echo DOCKER-COMPOSE ALREADY INSTALLED
fi

if ! [ -x "$(command -v teams)" ]; then
	echo INSTALLING TEAMS

	paru -Sy --noconfirm teams
else
	echo TEAMS ALREADY INSTALLED
fi

if ! [ -x "$(command -v kubectl)" ]; then
	echo INSTALLING KUBECTL

	paru -Sy --noconfirm kubectl-bin
else
	echo KUBECTL ALREADY INSTALLED
fi

if ! [ -x "$(command -v slack)" ]; then
	echo INSTALLING SLACK

	paru -Sy --noconfirm slack-desktop
else
	echo SLACK ALREADY INSTALLED
fi

if [ ! -f ~/.config/i3/config ]; then
	echo INSTALLING I3

	paru -Sy --noconfirm i3-gaps
	paru -Sy --noconfirm i3lock

	# status bar
	paru -Sy --noconfirm polybar
	# background
	paru -Sy --noconfirm feh
	paru -Sy --noconfirm i3-battery-popup-git
	# autostart
	paru -Sy --noconfirm dex
else
	echo I3 ALREADY INSTALLED
fi

if ! [ -x "$(command -v rofi)" ]; then
	echo INSTALLING ROFI

	# launcher
	paru -Sy --noconfirm rofi

	# clipboard manager
	paru -Sy --noconfirm rofi-greenclip
	systemctl --user enable greenclip.service
	systemctl --user start greenclip.service

	# bluetooth
	paru -S --noconfirm rofi-bluetooth-git
else
	echo ROFI ALREADY INSTALLED
fi

if ! [ -x "$(command -v dunst)" ]; then
	echo INSTALLING DUNST

	paru -Sy --noconfirm dbus

	paru -Sy --noconfirm dunst
else
	echo DUNST ALREADY INSTALLED
fi

if ! [ -x "$(command -v kitty)" ]; then
	echo INSTALLING KITTY

	paru -Sy --noconfirm kitty
else
	echo KITTY ALREADY INSTALLED
fi

if ! [ -x "$(command -v gnome-keyring)" ]; then
	echo INSTALLING KEYRING

	paru -Sy --noconfirm gnome-keyring
	paru -Sy --noconfirm libsecret
else
	echo KEYRING ALREADY INSTALLED
fi

if ! [ -x "$(command -v fzf)" ]; then
	echo INSTALLING FZF

	paru -Sy --noconfirm fzf
else
	echo FZF ALREADY INSTALLED
fi

if ! [ -x "$(command -v delta)" ]; then
	echo INSTALLING DELTA

	paru -Sy --noconfirm git-delta
else
	echo DELTA ALREADY INSTALLED
fi

if ! [ -x "$(command -v rg)" ]; then
	echo INSTALLING RG
	paru -Sy --noconfirm ripgrep
else
	echo RG ALREADY INSTALLED
fi

if ! [ -x "$(command -v fd)" ]; then
	echo INSTALLING FD

	paru -Sy --noconfirm fd
else
	echo FD ALREADY INSTALLED
fi

if ! [ -x "$(command -v ranger)" ]; then
	echo INSTALLING RANGER

	paru -Sy --noconfirm ranger

	# image preview for range
	paru -Sy --noconfirm ueberzug

	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
else
	echo RANGER ALREADY INSTALLED
fi

if ! [ -x "$(command -v udiskie)" ]; then
	echo INSTALLING UDISKIE

	paru -Sy --noconfirm udiskie
else
	echo UDISKIE ALREADY INSTALLED
fi

if ! [ -x "$(command -v btop)" ]; then
	echo INSTALLING BTOP

	paru -S --noconfirm btop
else
	echo BTOP ALREADY INSTALLED
fi

if ! [ -x "$(command -v navi)" ]; then
	echo INSTALLING NAVI

	paru -S --noconfirm navi
else
	echo NAVI ALREADY INSTALLED
fi

if ! [ -x "$(command -v tldr)" ]; then
	echo INSTALLING TLDR

	paru -S --noconfirm tldr
else
	echo TLDR ALREADY INSTALLED
fi

if ! [ -x "$(command -v dropbox)" ]; then
	echo INSTALLING DROPBOX

	paru -S --noconfirm dropbox
else
	echo DROPBOX ALREADY INSTALLED
fi

if ! [ -x "$(command -v flameshot)" ]; then
	echo INSTALLING FLAMESHOT

	paru -S --noconfirm flameshot
else
	echo FLAMESHOT ALREADY INSTALLED
fi

# if ! [ -x "$(command -v steam)" ]; then
# 	echo INSTALLING STEAM
#
# 	# https://wiki.archlinux.org/title/Steam#Installation
#
# 	## remember to enable multilib
# 	paru -S --noconfirm steam steam-fonts
# 	paru -S --noconfirm mangohud
# 	paru -S --noconfirm nvidia nvidia-utils lib32-nvidia-utils
#
# 	paru -S --noconfirm nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
# 	paru -S --noconfirm giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
# 	# paru -S --noconfirm dxvk-bin
#
# 	## for battlenet!
# 	paru -S --noconfirm lutris-git
#
# 	paru -S --noconfirm protonup-git
# 	protonup -d "~/.steam/root/compatibilitytools.d/"
# else
# 	echo STEAM ALREADY INSTALLED
# fi

if ! [ -x "$(command -v pipewire)" ]; then
	echo INSTALLING PIPEWIRE

	paru -S --noconfirm pipewire pipewire-pulse pipewire-alsa
	sudo systemctl status bluetooth.service

	# bluetooth
	paru -S --noconfirm bluez bluez-utils
else
	echo PIPEWIRE ALREADY INSTALLED
fi

if [ ! -f ~/.config/systemd/user/imwheel.service ]; then
	echo INSTALLING IMWHEEL

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
else
	echo IMWHEEL ALREADY INSTALLED
fi

if ! [ -x "$(command -v zathura)" ]; then
	echo INSTALLING ZATHURA

	paru -S --noconfirm zathura-git zathura-pdf-poppler-git
else
	echo ZATHURA ALREADY INSTALLED
fi

if ! [ -x "$(command -v cups)" ]; then
	echo "INSTALLING CUPS (printer driver)"

	paru -S --noconfirm cups cups-pdf system-config-printer
	paru -S --noconfirm samsung-unified-driver

	systemctl enable --now cups.service
	systemctl start --now cups.service
else
	echo CUPS ALREADY INSTALLED
fi

if ! [ -x "$(command -v thermald)" ]; then
	echo "INSTALLING THERMALD"

	paru -S --noconfirm thermald
	sudo systemctl enable --now thermald
	sudo systemctl start --now thermald
else
	echo THERMALD ALREADY INSTALLED
fi

if ! [ -x "$(command -v sddm)" ]; then
	echo "INSTALLING SDDM"

	paru -S --noconfirm sddm sddm-sugar-candy-git
	sudo systemctl enable --now sddm
  sudo mkdir /etc/sddm.conf.d -p
	sudo cp ./dotfiles/sddm.conf /etc/sddm.conf.d/sddm.conf
else
	echo SDDM ALREADY INSTALLED
fi

function installOpenfortivpn {
	if ! [ -x "$(command -v openfortivpn)" ]; then
		echo INSTALLING OPENFORTIVPN

		paru -S --noconfirm openfortivpn
	else
		echo OPENFORTIVPN ALREADY INSTALLED
	fi
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

function installAlbert {
	# app launcher
	paru -Sy --noconfirm albert-minimal

	ln -s /usr/share/applications/albert.desktop ~/.config/autostart/
}

echo '# CONFIGURATIONS'

if [ ! -f ~/.ssh/id_rsa.pub ]; then
	echo CONFIGURING SSH

	ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "$EMAIL" -P ""
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
else
	echo SSH ALREADY CONFIGURED
fi

if [ ! -d ~/.config/fontconfig/conf.d ]; then
	echo CONFIGURING SHARP FONTS

	mkdir -p ~/.config/fontconfig/conf.d
	ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf ~/.config/fontconfig/conf.d/
else
	echo SHARP FONTS ALREADY CONFIGURED
fi

rm -rf $TEMP_DIR

echo Purged temp folder

echo REMEMBER TO:
echo - update all packages and the system
echo - register ssh public key to github
echo - install node with nvm
echo '- disable alt+space shortcut (https://unix.stackexchange.com/questions/44643/change-global-keyboard-shortcuts)'
echo '-remember to configure keyring (https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method)'
echo '-remember to configure nvidia hook (https://wiki.archlinux.org/title/NVIDIA#pacman_hook)'
echo - reboot
