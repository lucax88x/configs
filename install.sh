#!/bin/bash

. ./installers.sh

DISTRO=${1}

case $DISTRO in
ARCH)
	echo installing for arch
	;;
OSX)
	echo installing for mac osx
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

# if ! [ -x "$(command -v docker)" ]; then
# 	echo INSTALLING DOCKER
#
# 	paru -Sy --noconfirm docker
#
# 	DOCKER_GROUP=docker
# 	getent group $DOCKER_GROUP || sudo groupadd $DOCKER_GROUP
# 	sudo usermod -aG "$DOCKER_GROUP" "$USER"
# 	# newgrp docker
# 	sudo systemctl enable docker.socket
# 	sudo systemctl start docker.socket
# else
# 	echo DOCKER ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v docker-compose)" ]; then
# 	echo INSTALLING DOCKER-COMPOSE
#
# 	paru -Sy --noconfirm docker-compose
# else
# 	echo DOCKER-COMPOSE ALREADY INSTALLED
# fi
#

# if [ ! -f ~/.config/i3/config ]; then
# 	echo INSTALLING I3
#
# 	paru -Sy --noconfirm i3-gaps
# 	paru -Sy --noconfirm i3lock
#
# 	# status bar
# 	paru -Sy --noconfirm polybar
# 	# background
# 	paru -Sy --noconfirm feh
# 	paru -Sy --noconfirm i3-battery-popup-git
# 	# autostart
# 	paru -Sy --noconfirm dex
# else
# 	echo I3 ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v rofi)" ]; then
# 	echo INSTALLING ROFI
#
# 	# launcher
# 	paru -Sy --noconfirm rofi
#
# 	# clipboard manager
# 	paru -Sy --noconfirm rofi-greenclip
# 	systemctl --user enable greenclip.service
# 	systemctl --user start greenclip.service
#
# 	# bluetooth
# 	paru -S --noconfirm rofi-bluetooth-git
# else
# 	echo ROFI ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v dunst)" ]; then
# 	echo INSTALLING DUNST
#
# 	paru -Sy --noconfirm dbus
#
# 	paru -Sy --noconfirm dunst
# else
# 	echo DUNST ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v kitty)" ]; then
# 	echo INSTALLING KITTY
#
# 	paru -Sy --noconfirm kitty
# else
# 	echo KITTY ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v gnome-keyring)" ]; then
# 	echo INSTALLING KEYRING
#
# 	paru -Sy --noconfirm gnome-keyring
# 	paru -Sy --noconfirm libsecret
# else
# 	echo KEYRING ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v ranger)" ]; then
# 	echo INSTALLING RANGER
#
# 	paru -Sy --noconfirm ranger
#
# 	# image preview for range
# 	paru -Sy --noconfirm ueberzug
#
# 	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
# else
# 	echo RANGER ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v udiskie)" ]; then
# 	echo INSTALLING UDISKIE
#
# 	paru -Sy --noconfirm udiskie
# else
# 	echo UDISKIE ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v btop)" ]; then
# 	echo INSTALLING BTOP
#
# 	paru -S --noconfirm btop
# else
# 	echo BTOP ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v navi)" ]; then
# 	echo INSTALLING NAVI
#
# 	paru -S --noconfirm navi
# else
# 	echo NAVI ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v tldr)" ]; then
# 	echo INSTALLING TLDR
#
# 	paru -S --noconfirm tldr
# else
# 	echo TLDR ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v dropbox)" ]; then
# 	echo INSTALLING DROPBOX
#
# 	paru -S --noconfirm dropbox
# else
# 	echo DROPBOX ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v flameshot)" ]; then
# 	echo INSTALLING FLAMESHOT
#
# 	paru -S --noconfirm flameshot
# else
# 	echo FLAMESHOT ALREADY INSTALLED
# fi
#
# # if ! [ -x "$(command -v steam)" ]; then
# # 	echo INSTALLING STEAM
# #
# # 	# https://wiki.archlinux.org/title/Steam#Installation
# paru -S --noconfirm flatpak
#  flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# flatpak --user install flathub com.valvesoftware.Steam
# flatpak run com.valvesoftware.Steam#
# noto-fonts?
# # 	## remember to enable multilib
# # 	paru -S --noconfirm steam steam-fonts
# # 	paru -S --noconfirm mangohud
# # 	paru -S --noconfirm nvidia nvidia-utils lib32-nvidia-utils
# #
# # 	paru -S --noconfirm nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
# # 	paru -S --noconfirm giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
# # 	# paru -S --noconfirm dxvk-bin
# #
# # 	## for battlenet!
# # 	paru -S --noconfirm lutris-git
# #
# # 	paru -S --noconfirm protonup-git
# # 	protonup -d "~/.steam/root/compatibilitytools.d/"
# # else
# # 	echo STEAM ALREADY INSTALLED
# # fi
#
# if ! [ -x "$(command -v pipewire)" ]; then
# 	echo INSTALLING PIPEWIRE
#
# 	paru -S --noconfirm pipewire pipewire-pulse pipewire-alsa
# 	sudo systemctl status bluetooth.service
#
# 	# bluetooth
# 	paru -S --noconfirm bluez bluez-utils
# else
# 	echo PIPEWIRE ALREADY INSTALLED
# fi
#
# if [ ! -f ~/.config/systemd/user/imwheel.service ]; then
# 	echo INSTALLING IMWHEEL
#
# 	paru -S --noconfirm imwheel
#
# 	sudo tee ~/.config/systemd/user/imwheel.service >/dev/null <<EOT
#   [Unit]
#   Description=IMWheel
#   Wants=display-manager.service
#   After=display-manager.service
#
#   [Service]
#   Type=simple
#   Environment=XAUTHORITY=%h/.Xauthority
#   ExecStart=/usr/bin/imwheel -d -b 45
#   ExecStop=/usr/bin/pkill imwheel
#   RemainAfterExit=yes
#
#   [Install]
#   WantedBy=default.target
# EOT
#
# 	systemctl --user daemon-reload
# 	systemctl --user enable --now imwheel.service
# 	systemctl --user start --now imwheel.service
# 	journalctl --user --unit imwheel.service
# else
# 	echo IMWHEEL ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v zathura)" ]; then
# 	echo INSTALLING ZATHURA
#
# 	paru -S --noconfirm zathura-git zathura-pdf-poppler-git
# else
# 	echo ZATHURA ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v cups)" ]; then
# 	echo "INSTALLING CUPS (printer driver)"
#
# 	paru -S --noconfirm cups cups-pdf system-config-printer
# 	paru -S --noconfirm samsung-unified-driver
#
# 	systemctl enable --now cups.service
# 	systemctl start --now cups.service
# else
# 	echo CUPS ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v thermald)" ]; then
# 	echo "INSTALLING THERMALD"
#
# 	paru -S --noconfirm thermald
# 	sudo systemctl enable --now thermald
# 	sudo systemctl start --now thermald
# else
# 	echo THERMALD ALREADY INSTALLED
# fi
#
# if ! [ -x "$(command -v sddm)" ]; then
# 	echo "INSTALLING SDDM"
#
# 	paru -S --noconfirm sddm sddm-sugar-candy-git
# 	sudo systemctl enable --now sddm
# 	sudo mkdir /etc/sddm.conf.d -p
# 	sudo cp ./dotfiles/sddm.conf /etc/sddm.conf.d/sddm.conf
# else
# 	echo SDDM ALREADY INSTALLED
# fi
#
# function installOpenfortivpn {
# 	if ! [ -x "$(command -v openfortivpn)" ]; then
# 		echo INSTALLING OPENFORTIVPN
#
# 		paru -S --noconfirm openfortivpn
# 	else
# 		echo OPENFORTIVPN ALREADY INSTALLED
# 	fi
# }
#
# function installTplinkWifi {
# 	paru -S --noconfirm rtl88x2bu-dkms-git
# 	sudo modprobe 88x2bu
# }
#
# function installNordvpn {
# 	paru -S --noconfirm nordvpn-bin
# 	sudo systemctl enable nordvpnd.service
# 	sudo systemctl start nordvpnd.service
# 	sudo usermod -aG nordvpn "$USER"
# }
#
# function installForticlient {
# 	paru -S --noconfirm forticlient-vpn
# 	sudo systemctl enable forticlient-scheduler
# 	sudo systemctl start forticlient-scheduler
# }
#
# function installVirtualization {
# 	paru -S --noconfirm qemu virt-manager qemu-arch-extra ovmf vde2 ebtables dnsmasq bridge-utils openbsd-netcat dmidecode
# 	sudo systemctl enable libvirtd.service
# 	sudo systemctl start libvirtd.service
#
# 	sudo virsh net-start default
# 	sudo virsh net-autostart default
#
# 	sudo usermod -aG libvirt "$USER"
# 	# sudo usermod -aG libvirt-qemu "$USER"
# 	# https://leduccc.medium.com/improving-the-performance-of-a-windows-10-guest-on-qemu-a5b3f54d9cf5
# }
#
# function installAlbert {
# 	# app launcher
# 	paru -Sy --noconfirm albert-minimal
#
# 	ln -s /usr/share/applications/albert.desktop ~/.config/autostart/
# }
#
# echo '# CONFIGURATIONS'
#
# if [ ! -f ~/.ssh/id_rsa.pub ]; then
# 	echo CONFIGURING SSH
#
# 	ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "$EMAIL" -P ""
# 	eval "$(ssh-agent -s)"
# 	ssh-add ~/.ssh/id_ed25519
# else
# 	echo SSH ALREADY CONFIGURED
# fi
#
# if [ ! -d ~/.config/fontconfig/conf.d ]; then
# 	echo CONFIGURING SHARP FONTS
#
# 	mkdir -p ~/.config/fontconfig/conf.d
# 	ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf ~/.config/fontconfig/conf.d/
# else
# 	echo SHARP FONTS ALREADY CONFIGURED
# fi
#
# plasma kde, kde-meta-system-applications + xdg-mime dolphin

rm -rf $TEMP_DIR

echo Purged temp folder

echo REMEMBER TO:
echo - update all packages and the system
echo - register ssh public key to github
echo '- disable alt+space shortcut (https://unix.stackexchange.com/questions/44643/change-global-keyboard-shortcuts)'
echo '-remember to configure keyring (https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method)'
echo '-remember to configure nvidia hook (https://wiki.archlinux.org/title/NVIDIA#pacman_hook)'
echo - reboot
