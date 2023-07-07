import { createEd25119SshKey } from "./installers.specific.mjs";
import {
  DISTROS,
  askConfirmation,
  exists,
  existsByPwsh,
  install,
  installByBrew,
  installByParu,
  installByScoop,
  noop,
} from "./utilities.mts";

const brew = install({
  command: "brew",
  installers: {
    ARCH: noop,
    WIN: noop,
    OSX: [
      exists("brew"),
      async () => {
        await $`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`;
        await $`brew analytics off`;

        return true;
      },
    ],
  },
});

const paru = install({
  command: "paru",
  installers: {
    OSX: noop,
    WIN: noop,
    ARCH: [
      exists("brew"),
      async () => {
        await $`git clone https://aur.archlinux.org/paru.git`;
        await $`cd paru && makepkg -si --noconfirm && cd ..`;
        await $`rm -rf paru`;

        return true;
      },
    ],
  },
});

const scoop = install({
  command: "scoop",
  installers: {
    OSX: noop,
    ARCH: noop,
    WIN: [
      existsByPwsh("scoop"),
      async () => {
        await $`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`;
        await $`irm get.scoop.sh | iex`;

        return true;
      },
    ],
  },
});

const baseDevel = install({
  command: "base-devel (make)",
  installers: {
    OSX: noop,
    WIN: [existsByPwsh("make"), installByScoop("make")],
    ARCH: [exists("make"), installByParu("base-devel")],
  },
});

const git = install({
  command: "git",
  installers: {
    WIN: [existsByPwsh("git"), installByScoop("git")],
    OSX: [exists("git"), installByBrew("git")],
    ARCH: [exists("git"), installByParu("git")],
  },
});

const zig = install({
  command: "zig",
  installers: {
    WIN: [existsByPwsh("zig"), installByScoop("zig")],
    OSX: noop,
    ARCH: [exists("zig"), installByParu("zig")],
  },
});

const rustup = install({
  command: "rustup",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("rustup"), installByParu("rustup")],
  },
});

const go = install({
  command: "go",
  installers: {
    WIN: [existsByPwsh("go"), installByScoop("go")],
    OSX: noop,
    ARCH: [exists("go"), installByParu("go")],
  },
});

const wget = install({
  command: "wget",
  installers: {
    WIN: [existsByPwsh("wget"), installByScoop("wget")],
    OSX: [exists("wget"), installByBrew("wget")],
    ARCH: [exists("wget"), installByParu("wget")],
  },
});

const curl = install({
  command: "curl",
  installers: {
    WIN: [existsByPwsh("curl"), installByScoop("curl")],
    OSX: [exists("curl"), installByBrew("curl")],
    ARCH: [exists("curl"), installByParu("curl")],
  },
});

const ssh = install({
  command: "ssh",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("ssh-keygen"), installByParu("openssh")],
  },
});

const unzip = install({
  command: "unzip",
  installers: {
    WIN: [existsByPwsh("unzip"), installByScoop("unzip")],
    OSX: [exists("unzip"), installByBrew("unzip")],
    ARCH: [exists("unzip"), installByParu("unzip")],
  },
});

const zsh = install({
  command: "zsh",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("zsh"), installByParu("zsh")],
  },
});

const volta = install({
  command: "volta",
  installers: {
    WIN: [existsByPwsh("volta"), installByScoop("volta")],
    OSX: [exists("volta"), installByBrew("volta")],
    ARCH: [exists("volta"), installByParu("volta-bin")],
  },
});

const bat = install({
  command: "bat",
  installers: {
    WIN: [existsByPwsh("bat"), installByScoop("bat")],
    OSX: [exists("bat"), installByBrew("bat")],
    ARCH: [exists("bat"), installByParu("bat")],
  },
});

const lsd = install({
  command: "lsd",
  installers: {
    WIN: [existsByPwsh("lsd"), installByScoop("lsd")],
    OSX: [exists("lsd"), installByBrew("lsd")],
    ARCH: [exists("lsd"), installByParu("lsd")],
  },
});

const fzf = install({
  command: "fzf",
  installers: {
    WIN: [existsByPwsh("fzf"), installByScoop("fzf")],
    OSX: [exists("fzf"), installByBrew("fzf")],
    ARCH: [exists("fzf"), installByParu("fzf")],
  },
});

const rg = install({
  command: "ripgrep",
  installers: {
    WIN: [existsByPwsh("rg"), installByScoop("rg")],
    OSX: [exists("rg"), installByBrew("rg")],
    ARCH: [exists("rg"), installByParu("rg")],
  },
});

const delta = install({
  command: "delta",
  installers: {
    WIN: [existsByPwsh("delta"), installByScoop("delta")],
    OSX: [exists("delta"), installByBrew("git-delta")],
    ARCH: [exists("delta"), installByParu("git-delta")],
  },
});

const fd = install({
  command: "fd",
  installers: {
    WIN: [existsByPwsh("fd"), installByScoop("fd")],
    OSX: [exists("fd"), installByBrew("fd")],
    ARCH: [exists("fd"), installByParu("fd")],
  },
});

const kubectl = install({
  command: "kubectl",
  installers: {
    WIN: [existsByPwsh("kubectl"), installByScoop("kubectl")],
    OSX: [exists("kubectl"), installByBrew("kubernetes-cli")],
    ARCH: [exists("kubectl"), installByParu("kubectl-bin")],
  },
});

const chrome = install({
  command: "google-chrome",
  installers: {
    WIN: [existsByPwsh("google-chrome-stable"), installByScoop("kubectl")],
    OSX: [exists("google-chrome-stable"), installByBrew("google-chrome", true)],
    ARCH: [
      exists("google-chrome-stable"),
      installByParu("google-chrome libvdpau vdpauinfo"),
    ],
  },
});

const telegram = install({
  command: "telegram-desktop",
  installers: {
    WIN: [existsByPwsh("telegram-desktop"), installByScoop("telegram-desktop")],
    OSX: [exists("telegram-desktop"), installByBrew("telegram-desktop", true)],
    ARCH: [exists("telegram-desktop"), installByParu("telegram-desktop")],
  },
});

const slack = install({
  command: "slack",
  installers: {
    WIN: [exists("slack"), installByScoop("slack")],
    OSX: [exists("slack"), installByBrew("slack")],
    ARCH: [exists("slack"), installByParu("slack")],
  },
});

// # if ! [ -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ]; then
const jetbrainsToolbox = install({
  command: "jetbrains toolbox",
  installers: {
    WIN: [exists("jetbrains-toolbox"), installByScoop("jetbrains-toolbox")],
    OSX: [exists("jetbrains-toolbox"), installByBrew("jetbrains-toolbox")],
    ARCH: [exists("jetbrains-toolbox"), installByParu("jetbrains-toolbox")],
  },
});

// 	curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo yay-key --add sublimehq-pub.gpg && sudo yay-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
// 	echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/yay.conf
const sublimeMerge = install({
  command: "sublime merge",
  installers: {
    WIN: [exists("smerge"), installByScoop("sublime-merge")],
    OSX: [exists("smerge"), installByBrew("sublime-merge")],
    ARCH: [exists("smerge"), installByParu("sublime-merge")],
  },
});

// 	paru -Sy --noconfirm dotnet-sdk-bin
// 	paru -Sy --noconfirm aspnet-runtime-bin

const configureEd25119Ssh = install({
  command: "create ssh key (ed25519)",
  installers: {
    WIN: createEd25119SshKey,
    OSX: createEd25119SshKey,
    ARCH: createEd25119SshKey,
  },
});

// # if [ ! -f ~/.ssh/id_rsa.pub ]; then
// # 	echo CONFIGURING SSH
// #
// # else
// # 	echo SSH ALREADY CONFIGURED
// # fi

export const installers: ((distro: DISTROS) => Promise<void>)[] = [
  // base
  brew,
  paru,
  scoop,
  baseDevel,
  git,

  // compilers
  zig,
  rustup,
  go,
  //
  zsh,
  volta,

  // tools
  wget,
  curl,
  ssh,
  unzip,
  bat,
  lsd,
  fzf,
  rg,
  delta,
  fd,
  kubectl,

  // ui
  chrome,
  telegram,
  slack,
  jetbrainsToolbox,
  sublimeMerge,

  // configuration
  configureEd25119Ssh,
];

export const installAll = async () => {
  let distro: DISTROS = "OSX";

  switch (argv.distro?.toLowerCase()) {
    case "osx":
      distro = "OSX";
      break;
    case "arch":
      distro = "ARCH";
      break;
    case "win":
      distro = "WIN";
      break;
    default:
      throw Error("must pass --distro");
  }

  if (
    !(await askConfirmation(`are you sure you want to install for ${distro}?`))
  ) {
    return;
  }

  for (let i = 0; i < installers.length; i++) {
    const installer = installers[i];

    await installer(distro);
  }
};