#!/usr/bin/env npx tsx

import "zx/globals";
// suppress stdout
$.verbose = true;

await $`chezmoi init https://github.com/lucax88x/dotfiles.git`
await $`chezmoi apply`

// UTM/QEMU virtualization
await $`sudo dnf install spice-vdagent`
await $`sudo dnf install qemu-guest-agent`
await $`sudo dnf install spice-webdavd`

await $`chsh -s $(which zsh)`

const checkConfig = await $`grep -q "max_parallel_downloads=" /etc/dnf/dnf.conf`.nothrow()

if (checkConfig.exitCode === 0) {
  console.log('Setting already exists in dnf.conf')
} else {
  await $`echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf`
  console.log('Added parallel downloads setting')
}

console.log('creating ssh keys')
// await $`ssh-keygen -t ed25519 -C "lucax88x@gmail.com"`;
// await $`eval "$(ssh-agent -s)"`;
