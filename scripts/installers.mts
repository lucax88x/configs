import { createEd25119SshKey } from "./installers.specific.mts";
import {
  DISTROS,
  askConfirmation,
  exists,
  existsApplicationInOsx,
  existsByPwsh,
  install,
  installByBrew,
  installByParu,
  installByScoop,
  installByApt,
  noop,
} from "./utilities.mts";

const brew = install({
  command: "brew",
  installers: {
    ARCH: noop,
    DEB: [
      exists("brew"),
      async () => {
        await $`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`;
        await $`(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/lucatrazzi/.bashrc`;
        await $`eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"`;
        await $`sudo apt-get install build-essential`;
        await $`brew install gcc`;
        await $`brew analytics off`;

        return true;
      },
    ],
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
    DEB: noop,
    ARCH: [
      exists("paru"),
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
    DEB: noop,
    WIN: [
      existsByPwsh("scoop"),
      async () => {
        await $`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`;
        await $`irm get.scoop.sh | iex`;

        await $`scoop bucket add main`;
        await $`scoop bucket add extras`;
        await $`scoop bucket add nerd-fonts`;

        return true;
      },
    ],
  },
});

const nala = install({
  command: "nala",
  installers: {
    OSX: noop,
    ARCH: noop,
    WIN: noop,
    DEB: [
      exists("nala"),
      async () => {
        await installByApt("nala")();

        await $`sudo nala update`;
        await $`sudo nala upgrade`;   

        return true;
      },
    ],
  },
});

const pwsh = install({
  command: "pwsh",
  installers: {
    WIN: [existsByPwsh("pwsh"), installByScoop("pwsh")],
    OSX: [exists("pwsh"), installByBrew("pwsh")],
    ARCH: [exists("pwsh"), installByParu("pwsh")],
    DEB: [exists("pwsh"), installByBrew("pwsh")],
  },
});

const baseDevel = install({
  command: "base-devel (make)",
  installers: {
    WIN: [existsByPwsh("make"), installByScoop("make")],
    OSX: noop,
    ARCH: [exists("make"), installByParu("base-devel")],
    DEB: noop,
  },
});

const git = install({
  command: "git",
  installers: {
    WIN: [existsByPwsh("git"), installByScoop("git")],
    OSX: [exists("git"), installByBrew("git")],
    ARCH: [exists("git"), installByParu("git")],
    DEB: [exists("git"), installByBrew("git")],
  },
});

const zig = install({
  command: "zig",
  installers: {
    WIN: [existsByPwsh("zig"), installByScoop("zig")],
    OSX: [exists("zig"), installByBrew("zig")],
    ARCH: [exists("zig"), installByParu("zig")],
    DEB: [exists("zig"), installByBrew("zig")],
  },
});

const rustup = install({
  command: "rustup",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("rustup"), installByParu("rustup")],
    DEB: noop,
  },
});

const go = install({
  command: "go",
  installers: {
    WIN: [existsByPwsh("go"), installByScoop("go")],
    OSX: noop,
    ARCH: [exists("go"), installByParu("go")],
    DEB: noop,
  },
});

const coreutils = install({
  command: "coreutils",
  installers: {
    WIN: [existsByPwsh("coreutils"), installByScoop("coreutils")],
    OSX: noop,
    ARCH: noop,
    DEB: noop,
  },
});

const wget = install({
  command: "wget",
  installers: {
    WIN: [existsByPwsh("wget"), installByScoop("wget")],
    OSX: [exists("wget"), installByBrew("wget")],
    ARCH: [exists("wget"), installByParu("wget")],
    DEB: [exists("wget"), installByBrew("wget")],
  },
});

const curl = install({
  command: "curl",
  installers: {
    WIN: [existsByPwsh("curl"), installByScoop("curl")],
    OSX: [exists("curl"), installByBrew("curl")],
    ARCH: [exists("curl"), installByParu("curl")],
    DEB: [exists("curl"), installByBrew("curl")],
  },
});

const ssh = install({
  command: "ssh",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("ssh-keygen"), installByParu("openssh")],
    DEB: noop,
  },
});

const unzip = install({
  command: "unzip",
  installers: {
    WIN: [existsByPwsh("unzip"), installByScoop("unzip")],
    OSX: [exists("unzip"), installByBrew("unzip")],
    ARCH: [exists("unzip"), installByParu("unzip")],
    DEB: [exists("unzip"), installByBrew("unzip")],
  },
});

const zsh = install({
  command: "zsh",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("zsh"), installByParu("zsh")],
    DEB: [exists("zsh"), installByBrew("zsh")],
  },
});

const bat = install({
  command: "bat",
  installers: {
    WIN: [existsByPwsh("bat"), installByScoop("bat")],
    OSX: [exists("bat"), installByBrew("bat")],
    ARCH: [exists("bat"), installByParu("bat")],
    DEB: [exists("bat"), installByBrew("bat")],
  },
});

const lsd = install({
  command: "lsd",
  installers: {
    WIN: [existsByPwsh("lsd"), installByScoop("lsd")],
    OSX: [exists("lsd"), installByBrew("lsd")],
    ARCH: [exists("lsd"), installByParu("lsd")],
    DEB: [exists("lsd"), installByBrew("lsd")],
  },
});

const fzf = install({
  command: "fzf",
  installers: {
    WIN: [existsByPwsh("fzf"), installByScoop("fzf")],
    OSX: [exists("fzf"), installByBrew("fzf")],
    ARCH: [exists("fzf"), installByParu("fzf")],
    DEB: [exists("fzf"), installByBrew("fzf")],
  },
});

const rg = install({
  command: "ripgrep",
  installers: {
    WIN: [existsByPwsh("rg"), installByScoop("ripgrep")],
    OSX: [exists("rg"), installByBrew("rg")],
    ARCH: [exists("rg"), installByParu("ripgrep-git")],
    DEB: [exists("rg"), installByBrew("ripgrep")],
  },
});

const delta = install({
  command: "delta",
  installers: {
    WIN: [existsByPwsh("delta"), installByScoop("delta")],
    OSX: [exists("delta"), installByBrew("git-delta")],
    ARCH: [exists("delta"), installByParu("git-delta")],
    DEB: [exists("delta"), installByBrew("delta")],
  },
});

const fd = install({
  command: "fd",
  installers: {
    WIN: [existsByPwsh("fd"), installByScoop("fd")],
    OSX: [exists("fd"), installByBrew("fd")],
    ARCH: [exists("fd"), installByParu("fd")],
    DEB: [exists("fd"), installByBrew("fd")],
  },
});

const kubectl = install({
  command: "kubectl",
  installers: {
    WIN: [existsByPwsh("kubectl"), installByScoop("kubectl")],
    OSX: [exists("kubectl"), installByBrew("kubernetes-cli")],
    ARCH: [exists("kubectl"), installByParu("kubectl-bin")],
    DEB: [exists("kubectl"), installByBrew("kubernetes-cli")],
  },
});

const zoxide = install({
  command: "zoxide",
  installers: {
    WIN: [existsByPwsh("z"), installByScoop("zoxide")],
    OSX: [exists("z"), installByBrew("zoxide")],
    ARCH: [exists("z"), installByParu("zoxide")],
    DEB: [exists("z"), installByBrew("zoxide")],
  },
});

const gh = install({
  command: "gh",
  installers: {
    WIN: [existsByPwsh("gh"), installByScoop("gh")],
    OSX: [exists("gh"), installByBrew("gh")],
    ARCH: [exists("gh"), installByParu("gh")],
    DEB: [exists("gh"), installByBrew("gh")],
  },
});

const chrome = install({
  command: "google-chrome",
  installers: {
    WIN: [existsByPwsh("google-chrome-stable"), installByScoop("googlechrome")],
    OSX: [
      existsApplicationInOsx("Google Chrome"),
      installByBrew("google-chrome", true),
    ],
    ARCH: [
      exists("google-chrome-stable"),
      installByParu("google-chrome"),
    ],
    DEB: [
      exists("google-chrome-stable"),
      installByBrew("google-chrome", true),
    ],
  },
});

const telegram = install({
  command: "telegram-desktop",
  installers: {
    WIN: [existsByPwsh("telegram"), installByScoop("telegram")],
    OSX: [
      existsApplicationInOsx("Telegram Desktop"),
      installByBrew("telegram-desktop", true),
    ],
    ARCH: [exists("telegram-desktop"), installByParu("telegram-desktop")],
    DEB: [exists("telegram-desktop"), installByBrew("telegram-desktop", true)],
  },
});

const whatsapp = install({
  command: "whatsapp",
  installers: {
    WIN: [existsByPwsh("whatsapp"), installByScoop("whatsapp")],
    OSX: [
      existsApplicationInOsx("Whatsapp"),
      installByBrew("whatsapp", true),
    ],
    ARCH: noop,
    DEB: noop,
  },
});

const slack = install({
  command: "slack",
  installers: {
    WIN: [exists("slack"), installByScoop("slack")],
    OSX: [existsApplicationInOsx("Slack"), installByBrew("slack", true)],
    ARCH: [exists("slack"), installByParu("slack")],
    DEB: [exists("slack"), installByBrew("slack", true)],
  },
});

// # if ! [ -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ]; then
const jetbrainsToolbox = install({
  command: "jetbrains toolbox",
  installers: {
    WIN: [exists("jetbrains-toolbox"), installByScoop("jetbrains-toolbox")],
    OSX: [existsApplicationInOsx("Jetbrains Toolbox"), installByBrew("jetbrains-toolbox", true)],
    ARCH: [exists("jetbrains-toolbox"), installByParu("jetbrains-toolbox")],
    DEB: [exists("jetbrains-toolbox"), installByBrew("jetbrains-toolbox", true)],
  },
});

// 	curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo yay-key --add sublimehq-pub.gpg && sudo yay-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
// 	echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/yay.conf
const sublimeMerge = install({
  command: "sublime merge",
  installers: {
    WIN: [exists("smerge"), installByScoop("sublime-merge")],
    OSX: [existsApplicationInOsx("Sublime Merge"), installByBrew("sublime-merge", true)],
    ARCH: [exists("smerge"), installByParu("sublime-merge")],
    DEB: [exists("smerge"), installByBrew("sublime-merge", true)],
  },
});

const wezterm = install({
  command: "wezterm",
  installers: {
    WIN: [exists("wezterm"), installByScoop("wezterm")],
    OSX: [existsApplicationInOsx("Wezterm"), installByBrew("wezterm", true)],
    ARCH: [exists("wezterm"), installByParu("wezterm")],
    DEB: [exists("wezterm"), installByBrew("wezterm", true)],
  },
});

const roboto = install({
  command: "roboto",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("ttf-roboto-mono"), installByParu("ttf-roboto-mono")],
    DEB: noop,
  },
});

const jetbrainsMono = install({
  command: "jetbrains mono",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("ttf-jetbrains-mono"), installByParu("ttf-jetbrains-mono")],
    DEB: noop,
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
    DEB: createEd25119SshKey,
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
  nala,
  pwsh,
  baseDevel,
  git,

  // compilers
  zig,
  rustup,
  go,
  //
  zsh,

  // tools
  coreutils,
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
  zoxide,
  gh,

  // i3
  // kde?

  // ui
  chrome,
  telegram,
  whatsapp,
  slack,
  jetbrainsToolbox,
  sublimeMerge,
  wezterm,

  roboto,
  jetbrainsMono,

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
    case "deb":
      distro = "DEB";
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
