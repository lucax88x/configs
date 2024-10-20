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
  installByNala,
  noop,
  existsFontInUnix,
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
    FED: [
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
    FED: noop,
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
    FED: noop,
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
  command: "nala (better apt)",
  installers: {
    OSX: noop,
    ARCH: noop,
    WIN: noop,
    FED: noop,
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
    OSX: [exists("pwsh"), installByBrew("powershell", true)],
    ARCH: [exists("pwsh"), installByParu("pwsh")],
    DEB: [exists("pwsh"), installByNala("powershell")],
    FED: noop,
  },
});

const volta = install({
  command: "volta",
  installers: {
    WIN: [existsByPwsh("volta"), installByScoop("volta")],
    OSX: [exists("volta"), installByBrew("volta")],
    ARCH: [exists("volta"), installByParu("volta")],
    DEB: [exists("volta"), installByBrew("volta")],
    FED: [exists("volta"), installByBrew("volta")],
  },
});

const baseDevel = install({
  command: "base-devel (make)",
  installers: {
    WIN: [existsByPwsh("make"), installByScoop("make")],
    OSX: noop,
    ARCH: [exists("make"), installByParu("base-devel")],
    DEB: noop,
    FED: noop,
  },
});

const git = install({
  command: "git",
  installers: {
    WIN: [existsByPwsh("git"), installByScoop("git")],
    OSX: [exists("git"), installByBrew("git")],
    ARCH: [exists("git"), installByParu("git")],
    DEB: [exists("git"), installByBrew("git")],
    FED: [exists("git"), installByBrew("git")],
  },
});

const zig = install({
  command: "zig",
  installers: {
    WIN: [existsByPwsh("zig"), installByScoop("zig")],
    OSX: [exists("zig"), installByBrew("zig")],
    ARCH: [exists("zig"), installByParu("zig")],
    DEB: [exists("zig"), installByBrew("zig")],
    FED: [exists("zig"), installByBrew("zig")],
  },
});

const bun = install({
  command: "bun",
  installers: {
    WIN: [existsByPwsh("bun"), installByScoop("bun")],
    OSX: [exists("bun"), installByBrew("oven-sh/bun/bun")],
    ARCH: [exists("bun"), installByParu("oven-sh/bun/bun")],
    DEB: [exists("bun"), installByBrew("oven-sh/bun/bun")],
    FED: [exists("bun"), installByBrew("oven-sh/bun/bun")],
  },
});


const rustup = install({
  command: "rustup",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("rustup"), installByParu("rustup")],
    DEB: noop,
    FED: noop,
  },
});

const go = install({
  command: "go",
  installers: {
    WIN: [existsByPwsh("go"), installByScoop("go")],
    OSX: [exists("go"), installByBrew("go")],
    ARCH: [exists("go"), installByParu("go")],
    DEB: noop,
    FED: noop,
  },
});

const wget = install({
  command: "wget",
  installers: {
    WIN: [existsByPwsh("wget"), installByScoop("wget")],
    OSX: [exists("wget"), installByBrew("wget")],
    ARCH: [exists("wget"), installByParu("wget")],
    DEB: [exists("wget"), installByBrew("wget")],
    FED: [exists("wget"), installByBrew("wget")],
  },
});

const coreutils = install({
  command: "coreutils",
  installers: {
    WIN: [existsByPwsh("mkdir"), installByScoop("coreutils")],
    OSX: noop,
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const curl = install({
  command: "curl",
  installers: {
    WIN: [existsByPwsh("curl"), installByScoop("curl")],
    OSX: [exists("curl"), installByBrew("curl")],
    ARCH: [exists("curl"), installByParu("curl")],
    DEB: [exists("curl"), installByBrew("curl")],
    FED: [exists("curl"), installByBrew("curl")],
  },
});

const ssh = install({
  command: "ssh",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("ssh-keygen"), installByParu("openssh")],
    DEB: noop,
    FED: noop,
  },
});

const chezmoi = install({
  command: "chezmoi",
  installers: {
    WIN: [existsByPwsh("chezmoi"), installByScoop("chezmoi")],
    OSX: [exists("chezmoi"), installByBrew("chezmoi")],
    ARCH: [exists("chezmoi"), installByParu("chezmoi")],
    DEB: [exists("chezmoi"), installByBrew("chezmoi")],
    FED: [exists("chezmoi"), installByBrew("chezmoi")],
  },
});

const unzip = install({
  command: "unzip",
  installers: {
    WIN: [existsByPwsh("unzip"), installByScoop("unzip")],
    OSX: [exists("unzip"), installByBrew("unzip")],
    ARCH: [exists("unzip"), installByParu("unzip")],
    DEB: [exists("unzip"), installByBrew("unzip")],
    FED: [exists("unzip"), installByBrew("unzip")],
  },
});

const zsh = install({
  command: "zsh",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("zsh"), installByParu("zsh")],
    DEB: [exists("zsh"), installByBrew("zsh")],
    FED: [exists("zsh"), installByBrew("zsh")],
  },
});

const bat = install({
  command: "bat",
  installers: {
    WIN: [existsByPwsh("bat"), installByScoop("bat")],
    OSX: [exists("bat"), installByBrew("bat")],
    ARCH: [exists("bat"), installByParu("bat")],
    DEB: [exists("bat"), installByBrew("bat")],
    FED: [exists("bat"), installByBrew("bat")],
  },
});

const lsd = install({
  command: "lsd",
  installers: {
    WIN: [existsByPwsh("lsd"), installByScoop("lsd")],
    OSX: [exists("lsd"), installByBrew("lsd")],
    ARCH: [exists("lsd"), installByParu("lsd")],
    DEB: [exists("lsd"), installByBrew("lsd")],
    FED: [exists("lsd"), installByBrew("lsd")],
  },
});

const fzf = install({
  command: "fzf",
  installers: {
    WIN: [existsByPwsh("fzf"), installByScoop("fzf")],
    OSX: [exists("fzf"), installByBrew("fzf")],
    ARCH: [exists("fzf"), installByParu("fzf")],
    DEB: [exists("fzf"), installByBrew("fzf")],
    FED: [exists("fzf"), installByBrew("fzf")],
  },
});

const rg = install({
  command: "ripgrep",
  installers: {
    WIN: [existsByPwsh("rg"), installByScoop("ripgrep")],
    OSX: [exists("rg"), installByBrew("rg")],
    ARCH: [exists("rg"), installByParu("ripgrep-git")],
    DEB: [exists("rg"), installByBrew("ripgrep")],
    FED: [exists("rg"), installByBrew("ripgrep")],
  },
});

const delta = install({
  command: "delta",
  installers: {
    WIN: [existsByPwsh("delta"), installByScoop("delta")],
    OSX: [exists("delta"), installByBrew("git-delta")],
    ARCH: [exists("delta"), installByParu("git-delta")],
    DEB: [exists("delta"), installByBrew("delta")],
    FED: [exists("delta"), installByBrew("delta")],
  },
});

const fd = install({
  command: "fd",
  installers: {
    WIN: [existsByPwsh("fd"), installByScoop("fd")],
    OSX: [exists("fd"), installByBrew("fd")],
    ARCH: [exists("fd"), installByParu("fd")],
    DEB: [exists("fd"), installByBrew("fd")],
    FED: [exists("fd"), installByBrew("fd")],
  },
});

const kubectl = install({
  command: "kubectl",
  installers: {
    WIN: [existsByPwsh("kubectl"), installByScoop("kubectl")],
    OSX: [exists("kubectl"), installByBrew("kubernetes-cli")],
    ARCH: [exists("kubectl"), installByParu("kubectl-bin")],
    DEB: [exists("kubectl"), installByBrew("kubernetes-cli")],
    FED: [exists("kubectl"), installByBrew("kubernetes-cli")],
  },
});

const zoxide = install({
  command: "zoxide",
  installers: {
    WIN: [existsByPwsh("zoxide"), installByScoop("zoxide")],
    OSX: [exists("zoxide"), installByBrew("zoxide")],
    ARCH: [exists("zoxide"), installByParu("zoxide")],
    DEB: [exists("zoxide"), installByBrew("zoxide")],
    FED: [exists("zoxide"), installByBrew("zoxide")],
  },
});

const gh = install({
  command: "gh",
  installers: {
    WIN: [existsByPwsh("gh"), installByScoop("gh")],
    OSX: [exists("gh"), installByBrew("gh")],
    ARCH: [exists("gh"), installByParu("gh")],
    DEB: [exists("gh"), installByBrew("gh")],
    FED: [exists("gh"), installByBrew("gh")],
  },
});

const atuin = install({
  command: "atuin (better c-r)",
  installers: {
    WIN: [exists("atuin"), installByScoop("atuin")],
    OSX: [exists("atuin"), installByBrew("atuin")],
    ARCH: [exists("atuin"), installByParu("atuin")],
    DEB: [exists("atuin"), installByBrew("atuin")],
    FED: [exists("atuin"), installByBrew("atuin")],
  },
});

const btop = install({
  command: "btop",
  installers: {
    WIN: noop,
    OSX: [exists("btop"), installByBrew("btop")],
    ARCH: [exists("btop"), installByParu("btop")],
    DEB: [exists("btop"), installByBrew("btop")],
    FED: [exists("btop"), installByBrew("btop")],
  },
});

const bob = install({
  command: "bob",
  installers: {
    WIN: [exists("bob"), installByScoop("bob")],
    OSX: [exists("bob"), installByBrew("bob")],
    ARCH: [exists("bob"), installByParu("bob")],
    DEB: [exists("bob"), installByBrew("bob")],
    FED: [exists("bob"), installByBrew("bob")],
  },
});

const ollama = install({
  command: "ollama",
  installers: {
    WIN: [exists("bob"), installByScoop("bob")],
    OSX: [exists("bob"), installByBrew("bob")],
    ARCH: [exists("bob"), installByParu("bob")],
    DEB: [exists("bob"), installByBrew("bob")],
    FED: [exists("bob"), installByBrew("bob")],
  },
});

const aerospace = install({
  command: "aerospace (i3 for osx)",
  installers: {
    WIN: noop,
    OSX: [
      exists("aerospace"),
      installByBrew("nikitabobko/tap/aerospace", true),
    ],
    ARCH: noop,
    DEB: noop,
    FED: noop,
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
    ARCH: [exists("google-chrome-stable"), installByParu("google-chrome")],
    DEB: [exists("google-chrome"), installByNala("google-chrome")],
    FED: noop,
  },
});

const edge = install({
  command: "microsoft-edge",
  installers: {
    WIN: [existsByPwsh("microsoft-edge"), installByScoop("microsoftedge")],
    OSX: [
      existsApplicationInOsx("Microsoft Edge"),
      installByBrew("microsoft-edge", true),
    ],
    ARCH: [exists("microsoft-edge"), installByParu("google-chrome")],
    DEB: [exists("microsoft-edge"), installByNala("microsoft-edge")],
    FED: noop,
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
    DEB: [exists("telegram-desktop"), installByNala("telegram-desktop")],
    FED: [exists("telegram-desktop"), installByBrew("telegram-desktop", true)],
  },
});

const whatsapp = install({
  command: "whatsapp",
  installers: {
    WIN: [existsByPwsh("whatsapp"), installByScoop("whatsapp")],
    OSX: [existsApplicationInOsx("Whatsapp"), installByBrew("whatsapp", true)],
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const slack = install({
  command: "slack",
  installers: {
    WIN: [exists("slack"), installByScoop("slack")],
    OSX: [existsApplicationInOsx("Slack"), installByBrew("slack", true)],
    ARCH: [exists("slack"), installByParu("slack")],
    DEB: [exists("slack"), installByNala("slack")],
    FED: noop,
  },
});

// # if ! [ -f ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ]; then
const jetbrainsToolbox = install({
  command: "jetbrains toolbox",
  installers: {
    WIN: [exists("jetbrains-toolbox"), installByScoop("jetbrains-toolbox")],
    OSX: [
      existsApplicationInOsx("Jetbrains Toolbox"),
      installByBrew("jetbrains-toolbox", true),
    ],
    ARCH: [exists("jetbrains-toolbox"), installByParu("jetbrains-toolbox")],
    DEB: [
      exists("jetbrains-toolbox"),
      installByNala("jetbrains-toolbox"),
    ],
    FED: noop,
  },
});

// 	curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo yay-key --add sublimehq-pub.gpg && sudo yay-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
// 	echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/yay.conf
const sublimeMerge = install({
  command: "sublime merge",
  installers: {
    WIN: [exists("smerge"), installByScoop("sublime-merge")],
    OSX: [
      existsApplicationInOsx("Sublime Merge"),
      installByBrew("sublime-merge", true),
    ],
    ARCH: [exists("smerge"), installByParu("sublime-merge")],
    DEB: [exists("smerge"), installByNala("sublime-merge")],
    FED: noop,
  },
});

const dockerDesktop = install({
  command: "docker desktop",
  installers: {
    WIN: noop,
    OSX: [
      exists("docker"),
      installByBrew("docker", true),
    ],
    ARCH: [exists("docker"), installByParu("docker-desktop")],
    DEB: [exists("docker"), installByNala("docker")],
    FED: noop,
  },
});

const wezterm = install({
  command: "wezterm",
  installers: {
    WIN: [exists("wezterm"), installByScoop("wezterm")],
    OSX: [existsApplicationInOsx("Wezterm"), installByBrew("wezterm", true)],
    ARCH: [exists("wezterm"), installByParu("wezterm")],
    DEB: [exists("wezterm"), installByNala("wezterm")],
    FED: noop,
  },
});

const kitty = install({
  command: "kitty",
  installers: {
    WIN: noop,
    OSX: [existsApplicationInOsx("kitty"), installByBrew("kitty", true)],
    ARCH: [exists("kitty"), installByParu("kitty")],
    DEB: [exists("kitty"), installByNala("kitty")],
    FED: noop,
  },
});

const neovide = install({
  command: "neovide",
  installers: {
    WIN: noop,
    OSX: [existsApplicationInOsx("Neovide"), installByBrew("neovide", true)],
    ARCH: [exists("neovide"), installByParu("neovide")],
    DEB: [exists("neovide"), installByNala("neovide")],
    FED: noop,
  },
});

const raycast = install({
  command: "raycast",
  installers: {
    WIN: noop,
    OSX: [existsApplicationInOsx("Raycast"), installByBrew("raycast", true)],
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const bartender = install({
  command: "bartender (menubar arrange for osx)",
  installers: {
    WIN: noop,
    OSX: [existsApplicationInOsx("Bartender 5"), installByBrew("bartender", true)],
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const contexts = install({
  command: "contexts (app switcher)",
  installers: {
    WIN: noop,
    OSX: [existsApplicationInOsx("Contexts"), installByBrew("contexts", true)],
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const stats = install({
  command: "stats (usage widgets for osx)",
  installers: {
    WIN: noop,
    OSX: [existsApplicationInOsx("Stats"), installByBrew("stats", true)],
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const obsidian = install({
  command: "obsidian",
  installers: {
    WIN: noop,
    OSX: [existsApplicationInOsx("Obsidian"), installByBrew("obsidian", true)],
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const switcheroo = install({
  command: "todoswitcheroo",
  installers: {
    WIN: [exists("switcheroo"), installByScoop("switcheroo")],
    OSX: noop,
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const flowLauncher = install({
  command: "flowLauncher",
  installers: {
    WIN: [exists("todoflowlauncher"), installByScoop("flowlauncher")],
    OSX: noop,
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const fontconfig = install({
  command: "fc-list",
  installers: {
    WIN: noop,
    OSX: [exists("fc-list"), installByBrew("fontconfig")],
    ARCH: noop,
    DEB: noop,
    FED: noop,
  },
});

const roboto = install({
  command: "roboto",
  installers: {
    WIN: noop,
    OSX: noop,
    ARCH: [exists("ttf-roboto-mono"), installByParu("ttf-roboto-mono")],
    DEB: noop,
    FED: noop,
  },
});

const jetbrainsMono = install({
  command: "jetbrains mono",
  installers: {
    WIN: noop,
    OSX: [
      existsFontInUnix("JetBrainsMono"),
      installByBrew("font-jetbrains-mono"),
    ],
    ARCH: [
      existsFontInUnix("JetBrainsMono"),
      installByParu("ttf-jetbrains-mono"),
    ],
    DEB: [
      existsFontInUnix("JetBrainsMono"),
      installByBrew("font-jetbrains-mono"),
    ],
    FED: [
      existsFontInUnix("JetBrainsMono"),
      installByBrew("font-jetbrains-mono"),
    ],
  },
});

// const nerdFonts = install({
//   command: "nerd fonts",
//   installers: {
//     WIN: noop,
//     OSX: [
//       existsFontInUnix("JetBrainsMono"),
//       installByBrew("font-symbols-only-nerd-font"),
//     ],
//     ARCH: [
//       existsFontInUnix("JetBrainsMono"),
//       installByParu("ttf-jetbrains-mono"),
//     ],
//     DEB: [
//       existsFontInUnix("JetBrainsMono"),
//       installByBrew("font-jetbrains-mono"),
//     ],
//     FED: [
//       existsFontInUnix("JetBrainsMono"),
//       installByBrew("font-jetbrains-mono"),
//     ],
//   },
// });

// 	paru -Sy --noconfirm dotnet-sdk-bin
// 	paru -Sy --noconfirm aspnet-runtime-bin

export const installers: ((distro: DISTROS) => Promise<void>)[] = [
  // base
  brew,
  paru,
  scoop,
  nala,
  pwsh,
  baseDevel,
  git,

  // dev
  volta,
  zig,
  bun,
  rustup,
  go,
  //
  zsh,

  // tools
  coreutils,
  wget,
  curl,
  ssh,
  chezmoi,
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
  atuin,
  btop,
  bob,
  // ollama,

  // i3
  // kde?

  // ui
  aerospace,
  chrome,
  edge,
  telegram,
  whatsapp,
  slack,
  jetbrainsToolbox,
  sublimeMerge,
  dockerDesktop,
  wezterm,
  kitty,
  neovide,
  raycast,
  stats,
  bartender,
  contexts,
  obsidian,
  switcheroo,
  flowLauncher,

  fontconfig,
  roboto,
  jetbrainsMono,
  // nerdFonts,
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
    case "fed":
      distro = "FED";
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

  for (let i = 0; i < installers.length; i++) {
    const installer = installers[i];

    await installer(distro);
  }
};
