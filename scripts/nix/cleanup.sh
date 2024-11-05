#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  exec sudo "$0" "$@"
fi

# (good time to reboot)
# Remove Nix APFS volume (not sure how to do this in shell, but the Disk Utility app should do the trick)
# Remove Nix user group (once again not sure how to with shell, can System Preferences > Users & Groups covers this)
# Cleanup /etc/bash.bashrc, /etc/bashrc
# Cleanup /etc/zshrc

echo "delete volume"
diskutil apfs deleteVolume /nix || true
echo "purge folders"

# Remove /etc/nix
rm -rf /etc/nix || true
rm -rf /nix || true

# Remove .nix* files in /var/root/ and /var/root/.cache
rm -rf /var/root/.nix* /var/root/.cache/.nix* || true
rm -rf /var/root/.nix-profile || true
rm -rf /var/root/.nix-defexpr || true
rm -rf /var/root/.nix-channels || true
rm -rf ~/.nix-profile || true
rm -rf ~/.nix-defexpr || true
rm -rf ~/.nix-channels || true

# Remove any nix traces in ~/Applications
rm -rf ~/Applications/nix* || true
# Remove .nix* files in ~/, ~/.config and ~/.cache
rm -rf ~/.nix* ~/.config/.nix* ~/.cache/.nix* || true

echo "removing nixbld group and users"
sudo dscl . -delete /Groups/nixbld
for u in $(sudo dscl . -list /Users | grep _nixbld); do sudo dscl . -delete /Users/$u; done

if [ -f /Library/LaunchDaemons/org.nixos.nix-daemon.plist ]; then
  # Remove Nix from launchd (see /Library/LaunchDaemons and ~/Library/LaunchDaemons)
  echo "nix-daemon daemon"
  launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist || true
  mv /Library/LaunchDaemons/org.nixos.nix-daemon.plist ~/Desktop || true
  rm -r ~/Desktop/org.nixos.nix-daemon.plist || true
fi

if [ -f /Library/LaunchDaemons/org.nixos.darwin-store.plist ]; then
  echo "darwin-store daemon"
  launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist || true
  mv /Library/LaunchDaemons/org.nixos.darwin-store.plist ~/Desktop || true
  rm -r ~/Desktop/org.nixos.darwin-store.plist || true
fi

if grep -q "nix" /etc/fstab; then
  echo "WARNING: Found nix entries in /etc/fstab"
  echo "Please use 'sudo vifs' to manually remove any nix-related entries from /etc/fstab"
fi

if [ -f /etc/synthetic.conf ]; then
  echo "Removing nix entries from /etc/synthetic.conf"
  sudo sed -i.bak '/^nix/d' /etc/synthetic.conf
  # Remove backup if original file exists
  rm -f /etc/synthetic.conf.bak
fi

if [ -f ~/.zshrc ]; then
  echo "Removing nix entries from ~/.zshrc"
  sed -i.bak '/# Nix/d' ~/.zshrc
  sed -i.bak '/if \[ -e.*nix/,/fi/d' ~/.zshrc
  rm -f ~/.zshrc.bak
fi
