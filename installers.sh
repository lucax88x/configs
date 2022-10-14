#!/bin/bash

installParu() {
	case $DISTRO in
	ARCH)
		if ! [ -x "$(command -v paru)" ]; then
			echo INSTALLING PARU

			git clone https://aur.archlinux.org/paru.git
			cd paru && makepkg -si --noconfirm && cd ..
			rm -rf paru
		else
			echo PARU ALREADY INSTALLED
		fi
		;;
	OSX)
		echo SKIPPING PARU
		;;
	esac
}

installBaseDevel() {
	case $DISTRO in
	ARCH)
		if ! [ -x "$(command -v make)" ]; then
			echo INSTALLING BASE-DEVEL

			paru -S --noconfirm base-devel
		else
			echo BASE-DEVEL ALREADY INSTALLED
		fi
		;;
	OSX)
		echo SKIPPING BASE-DEVEL
		;;
	esac
}

installGit() {
	if ! [ -x "$(command -v git)" ]; then
		case $DISTRO in
		ARCH)
			echo INSTALLING GIT

			paru -S --noconfirm git
			;;
		OSX)
			echo INSTALLING GIT

			brew install git
			;;
		esac
	else
		echo GIT ALREADY INSTALLED
	fi
}

installWget() {
	if ! [ -x "$(command -v wget)" ]; then
		case $DISTRO in
		ARCH)
			echo INSTALLING WGET
			paru -S --noconfirm wget
			;;
		OSX)
			echo INSTALLING WGET
			brew install wget
			;;
		esac
	else
		echo WGET ALREADY INSTALLED
	fi
}

installCurl() {
	if ! [ -x "$(command -v curl)" ]; then
		case $DISTRO in
		ARCH)
			echo INSTALLING CURL
			paru -S --noconfirm curl
			;;
		OSX)
			echo INSTALLING CURL
			brew install curl
			;;
		esac
	else
		echo CURL ALREADY INSTALLED
	fi
}

installSsh() {
	case $DISTRO in
	ARCH)
		if ! [ -x "$(command -v ssh-keygen)" ]; then
			echo INSTALLING SSH

			paru -S --noconfirm openssh
		else
			echo SSH ALREADY INSTALLED
		fi
		;;

	OSX)
		echo SKIPPING SSH
		;;
	esac
}

installUnzip() {
	case $DISTRO in
	ARCH)
		if ! [ -x "$(command -v unzip)" ]; then
			echo INSTALLING UNZIP

			paru -S --noconfirm unzip
		else
			echo UNZIP ALREADY INSTALLED
		fi
		;;

	OSX)
		echo SKIPPING UNZIP
		;;
	esac
}

installYabai() {
	case $DISTRO in
	ARCH)
		echo SKIPPING YABAI
		;;

	OSX)
		if ! [ -x "$(command -v yabai)" ]; then
			echo INSTALLING YABAI

			brew install koekeishiya/formulae/yabai
			brew services start yabai
			brew install koekeishiya/formulae/skhd
			brew services start skhd

			brew install sketchybar
			brew services start sketchybar
			# font-hack-nerd-font
		else
			echo YABAI ALREADY INSTALLED
		fi
		;;
	esac
}

installHammerspoon() {
	case $DISTRO in
	ARCH)
		echo SKIPPING HAMMERSPOON
		;;

	OSX)
		if ! [ -x "$(brew info hammerspoon)" ]; then
			echo INSTALLING HAMMERSPOON

			brew install hammerspoon

		else
			echo HAMMERSPOON ALREADY INSTALLED
		fi
		;;

	esac
}
