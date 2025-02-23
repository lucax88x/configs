#!/usr/bin/env npx tsx

import "zx/globals";

await $`chezmoi init https://github.com/lucax88x/dotfiles.git`
await $`chezmoi apply`

// UTM/QEMU virtualization
await $`sudo dnf install spice-vdagent`
await $`sudo dnf install qemu-guest-agent`
await $`sudo dnf install spice-webdavd`

await $`chsh -s $(which zsh)`
