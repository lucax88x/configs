#!/usr/bin/env npx tsx

import { question, os, fs } from "zx";
import "zx/globals";

console.log(chalk.cyan("Creating symlinks from repo to home directory"));

const canContinue = await question(
  chalk.green("Are you want to continue (y/n)?"),
);

if (!canContinue) {
  console.error("Aborting");
  await $`exit 1`;
}

const forBoth = [
  ".config/kitty",
  ".config/nvim",
  ".config/ranger/rc.conf",
  ".config/wezterm",
  ".gitconfig",
  "bin",
  ".ideavimrc",
  ".zshrc",
  ".zshrc.env",
  ".p10k.zsh",
  ".zprofile",
  ".local/share/navi/cheats/lucatrazzi__cheats",
  ".ssh/config",
];

const forOsx = [...forBoth, ".aerospace.toml", ".tmux.conf", ".zshrc.env"];

const forLinux = [
  ...forBoth,
  ".config/X11",
  ".config/rofi",
  ".config/dunst/dunstrc",
  ".config/polybar",
  ".config/i3/config",
  ".imwheelrc",
];

switch (os.type()) {
  case "Linux":
    await syncAll(forLinux);
    break;
  case "Darwin":
    await syncAll(forOsx);
    break;
  default:
    console.error(`did not recognize the OS with ${os.type()}`);
    await $`exit 1`;
    break;
}

async function sync(from: string, to: string) {
  console.log(`PROCESSING ${from} to ${to}`);

  try {
    if (await fs.exists(to)) {
      const fileInfo = await fs.lstat(to);
      if (fileInfo.isSymbolicLink()) {
        console.log(chalk.gray("Good link, skipping"));
      } else {
        console.log(chalk.red("Broken link, stopping"));
        await $`exit 1`;
      }
    } else {
      await fs.symlink(from, to);
      console.log(chalk.green("Created!"));
    }
  } catch (error) {
    console.error(error);
    await $`exit 1`;
  }
}

async function syncAll(paths: string[]) {
  try {
    await fs.mkdir(os.homedir());
  } catch (error) {
    console.error(error);
  }

  const fullFromPath = path.resolve(".");

  for (const toCheckPath of paths) {
    const from = path.join(fullFromPath, "dotfiles", toCheckPath);
    const to = path.join(os.homedir(), toCheckPath);

    await sync(from, to);
  }
}
