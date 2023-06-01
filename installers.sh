#!/bin/bash

installBrew() {
	case $DISTRO in
	ARCH)
		echo SKIPPING BREW
		;;
	OSX)
		if ! [ -x "$(command -v brew)" ]; then
			echo INSTALLING BREW

			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
			brew analytics off
		else
			echo BREW ALREADY INSTALLED
		fi
		;;
	esac
}

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
			brew install koekeishiya/formulae/skhd
			brew services start yabai
			brew services start skhd

			echo "Installing yabai scripting addition (!!sudo!!)"

			sudo yabai --install-sa

			csrutil status
			open "$HOME/.config/keyboard/KeyboardModifierKeySetup.png"
			echo "Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"

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
		if ! brew list hammerspoon &>/dev/null; then

			echo INSTALLING HAMMERSPOON

			# brew install hammerspoon

		else
			echo HAMMERSPOON ALREADY INSTALLED
		fi
		;;

	esac
}

installJetbrainsMono() {
	case $DISTRO in
	ARCH)
		if ! [ "$(fc-list | grep -c 'JetBrains')" -ge 1 ]; then
			echo INSTALLING JETBRAINS MONO

			paru -S --noconfirm nerd-fonts-jetbrains-mono
			paru -S --noconfirm ttf-jetbrains-mono-git
		else
			echo JETBRAINS MONO ALREADY INSTALLED
		fi
		;;
	OSX)
		if ! brew list font-jetbrains-mono &>/dev/null; then
			echo INSTALLING JETBRAINS MONO

			brew install font-jetbrains-mono
		else
			echo JETBRAINS MONO ALREADY INSTALLED
		fi
		;;
	esac
}

installOpensans() {
	case $DISTRO in
	ARCH)
		if ! [ "$(fc-list | grep -c 'Open Sans')" -ge 1 ]; then
			echo INSTALLING OPEN SANS

			wget https://fonts.google.com/download?family=Open+Sans -O "$TEMP_DIR/OpenSans.zip"

			unzip "$TEMP_DIR"/OpenSans.zip -d "$TEMP_DIR"/open-sans
			mkdir -p ~/.fonts/open-sans
			cp -r "$TEMP_DIR"/open-sans/* ~/.fonts/open-sans

			fc-cache
		else
			echo OPEN SANS ALREADY INSTALLED
		fi
		;;
	OSX)
		echo SKIPPING OPEN SANS
		;;
	esac
}

installRoboto() {
	case $DISTRO in
	ARCH)
		if ! [ "$(fc-list | grep -c 'Roboto')" -ge 1 ]; then
			echo INSTALLING ROBOTO

			wget https://fonts.google.com/download?family=Roboto -O "$TEMP_DIR/Roboto.zip"

			unzip "$TEMP_DIR"/Roboto.zip -d "$TEMP_DIR"/roboto
			mkdir -p ~/.fonts/roboto
			cp -r "$TEMP_DIR"/roboto/* ~/.fonts/roboto

			fc-cache
		else
			echo ROBOTO ALREADY INSTALLED
		fi
		;;
	OSX)
		echo SKIPPING ROBOTO
		;;
	esac
}

installSymbolsOnly() {
	case $DISTRO in
	ARCH)
		echo SKIPPING SYMBOLS_ONLY
		;;
	OSX)
    brew tap homebrew/cask-fonts
    brew install --cask font-symbols-only-nerd-font

		;;
	esac
}

installFontawesome() {
	case $DISTRO in
	ARCH)
		if ! [ "$(fc-list | grep -c 'Font Awesome 5 Free')" -ge 1 ]; then
			echo INSTALLING FONTAWESOME

			# wget https://github.com/FortAwesome/Font-Awesome/releases/download/$FONTAWESOME_VERSION/fontawesome-free-$FONTAWESOME_VERSION-desktop.zip -O $TEMP_DIR/FontAwesome.zip

			# unzip $TEMP_DIR/FontAwesome.zip -d ~/.fonts/fontawesome5

			# fc-cache
			echo MANUALLY INSTALL FONTAWESOME 5 PRO!
		else
			echo FONTAWESOME ALREADY INSTALLED
		fi
		;;
	OSX)
		echo SKIPPING FONTAWESOME
		;;
	esac
}

installFreetype() {
	case $DISTRO in
	ARCH)
		if ! pacman -Qs freetype2-ultimate5 >/dev/null; then
			echo INSTALLING FREETYPE PATCHED

			paru -Sy --noconfirm freetype2-ultimate5
		else
			echo PATCHED FREETYPE ALREADY INSTALLED
		fi
		;;
	OSX)
		echo SKIPPING FREETYPE
		;;
	esac
}

installSFMono() {
	case $DISTRO in
	ARCH)
		echo SKIPPING SF MONO
		;;
	OSX)
		if ! [ "$(find ~/Library/Fonts/ -name '*SFMono*')" ]; then
			echo INSTALLING SF MONO
			git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git "$TEMP_DIR/SFMono_Nerd_Font"
			mv "$TEMP_DIR"/SFMono_Nerd_Font/* ~/Library/Fonts
		else
			echo SF MONO ALREADY INSTALLED
		fi
		;;

	esac
}

installSFPro() {
	case $DISTRO in
	ARCH)
		echo SKIPPING SF Pro
		;;
	OSX)
		if ! brew list font-sf-pro &>/dev/null; then

			echo INSTALLING HACK NERD FONT

			brew tap homebrew/cask-fonts
			brew install font-sf-pro
		else
			echo HACK NERD FONT ALREADY INSTALLED
		fi
		;;

	esac
}

installHackNerdFont() {
	case $DISTRO in
	ARCH)
		echo SKIPPING HACK NERD FONT
		;;
	OSX)
		if ! brew list font-hack-nerd-font &>/dev/null; then
			echo INSTALLING HACK NERD FONT
			brew install --cask font-hack-nerd-font
		else
			echo HACK NERD FONT ALREADY INSTALLED
		fi
		;;

	esac
}

configureOs() {
	# needs to be tested
	defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	defaults write com.apple.spaces spans-displays -bool false
	defaults write com.apple.dock autohide -bool true
	defaults write com.apple.dock "mru-spaces" -bool "false"
	defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
	defaults write com.apple.LaunchServices LSQuarantine -bool false
	defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
	defaults write NSGlobalDomain KeyRepeat -int 1
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true
	defaults write NSGlobalDomain _HIHideMenuBar -bool true
	defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
	defaults write NSGlobalDomain AppleAccentColor -int 1
	defaults write com.apple.screencapture location -string "$HOME/Desktop"
	defaults write com.apple.screencapture disable-shadow -bool true
	defaults write com.apple.screencapture type -string "png"
	defaults write com.apple.finder DisableAllAnimations -bool true
	defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
	defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
	defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
	defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
	defaults write com.apple.Finder AppleShowAllFiles -bool true
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
	defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
	defaults write com.apple.finder ShowStatusBar -bool false
	defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
	defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
	defaults write com.apple.Safari IncludeDevelopMenu -bool true
	defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
	defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
	defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
}
