#!/usr/bin/env npx tsx

import "zx/globals";

// // suppress stdout
// $.verbose = true;

// add to developer group
await $`sudo dscl . append /Groups/_developer GroupMembership luca.trazzi`

// 15 is lowest setting on UI
// 8 was too fast causing duplicate keystrokes
// 10 i think this causes issues in bash cli when editing commands, not sure
await $`defaults write -g InitialKeyRepeat -int 12`;
// 2 is lowest setting on UI
await $`defaults write -g KeyRepeat -int 1`

// allow holding key instead of mac default holding key to choose alternate key
await $`defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false`

// suggested for Aerospace
await $`defaults write -g NSWindowShouldDragOnGesture YES`

// Allows browsing of all network interfaces in Finder.
await $`defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1`

// Prevents macOS from writing .DS_Store files to network drives.
await $`defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true`

// Automatically hides the Dock.
await $`defaults write com.apple.dock autohide -bool true`

// Disables the recent applications in the Dock.
await $`defaults write com.apple.dock "mru-spaces" -bool "false"`

// Disables animations when opening and closing windows.
await $`defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false`

// Disables the quarantine warning for downloaded applications.
await $`defaults write com.apple.LaunchServices LSQuarantine -bool false`

// Disables natural scroll direction (scrolling behaves like traditional scrolling).
await $`defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false`

// Disables automatic spelling correction.
await $`defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false`

// Ensures all file extensions are shown in Finder.
await $`defaults write NSGlobalDomain AppleShowAllExtensions -bool true`

// Hides the menu bar (it will show when you move the mouse to the top of the screen).
await $`defaults write NSGlobalDomain _HIHideMenuBar -bool true`

// Saves screenshots to the Desktop.
await $`defaults write com.apple.screencapture location -string "$HOME/Desktop"`

// Disables the shadow in screenshots.
await $`defaults write com.apple.screencapture disable-shadow -bool true`

// # Sets the screenshot file format to PNG.
await $`defaults write com.apple.screencapture type -string "png"`

// Disables animations in Finder.
await $`defaults write com.apple.finder DisableAllAnimations -bool true`

// Hides external hard drives from the Desktop.
await $`defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false`

// Hides internal hard drives from the Desktop.
await $`defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false`

// Hides mounted servers from the Desktop.
await $`defaults write com.apple.finder ShowMountedServersOnDesktop -bool false`

// Hides removable media from the Desktop.
await $`defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false`

// Shows hidden files in Finder.
await $`defaults write com.apple.Finder AppleShowAllFiles -bool true`

// Sets Finder’s default search scope to the current folder.
await $`defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"`

// Disables the warning when changing a file’s extension.
await $`defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false`

// Shows the POSIX path in the Finder window title.
await $`defaults write com.apple.finder _FXShowPosixPathInTitle -bool true`

// Sets the preferred view style in Finder to list view.
await $`defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"`

// Hides the status bar in Finder.
await $`defaults write com.apple.finder ShowStatusBar -bool false`

// Stops Time Machine from prompting to use new disks for backup.
await $`defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES`

// For aerospace
await $`defaults write com.apple.spaces spans-displays -bool true`
await $`defaults write com.apple.dock expose-group-apps -bool true`

// // Enables the Develop menu in Safari.
// await $`defaults write com.apple.Safari IncludeDevelopMenu -bool true`
//
// // Enables WebKit Developer Extras in Safari.
// await $`defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true`
// await $`defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true`
// await $`defaults write NSGlobalDomain WebKitDeveloperExtras -bool true`
