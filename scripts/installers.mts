import {
  exists,
  install,
  installByBrew,
  installByBrewAsCask,
  installByParu,
  noop,
} from "./utilities.mts";

const brew = () =>
  install({
    command: "brew",
    condition: exists("brew"),
    installers: {
      ARCH: noop,
      OSX: async () => {
        await $`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`;
        await $`brew analytics off`;

        return true;
      },
    },
  });

const paru = () =>
  install({
    command: "paru",
    condition: exists("paru"),
    installers: {
      OSX: noop,
      ARCH: async () => {
        await $`git clone https://aur.archlinux.org/paru.git`;
        await $`cd paru && makepkg -si --noconfirm && cd ..`;
        await $`rm -rf paru`;

        return true;
      },
    },
  });

const baseDevel = () =>
  install({
    command: "base-devel (make)",
    condition: exists("make"),
    installers: {
      OSX: noop,
      ARCH: installByParu("base-devel"),
    },
  });

const git = () =>
  install({
    command: "git",
    condition: exists("git"),
    installers: {
      OSX: installByBrew("git"),
      ARCH: installByParu("git"),
    },
  });

const rustup = () =>
  install({
    command: "rustup",
    condition: exists("rustup"),
    installers: {
      OSX: noop,
      ARCH: installByParu("rustup"),
    },
  });

const go = () =>
  install({
    command: "go",
    condition: exists("go"),
    installers: {
      OSX: noop,
      ARCH: installByParu("go"),
    },
  });

const wget = () =>
  install({
    command: "wget",
    condition: exists("wget"),
    installers: {
      OSX: installByBrew("wget"),
      ARCH: installByParu("wget"),
    },
  });

const curl = () =>
  install({
    command: "curl",
    condition: exists("curl"),
    installers: {
      OSX: installByBrew("curl"),
      ARCH: installByParu("curl"),
    },
  });

const ssh = () =>
  install({
    command: "ssh",
    condition: exists("ssh-keygen"),
    installers: {
      OSX: noop,
      ARCH: installByParu("openssh"),
    },
  });

const unzip = () =>
  install({
    command: "unzip",
    condition: exists("unzip"),
    installers: {
      OSX: noop,
      ARCH: installByParu("unzip"),
    },
  });

const zsh = () =>
  install({
    command: "zsh",
    condition: exists("zsh"),
    installers: {
      OSX: noop,
      ARCH: installByParu("zsh"),
    },
  });

const voltaInstaller = async () => {
  await $`curl https://get.volta.sh | bash`;

  return true;
};
const volta = () =>
  install({
    command: "volta",
    condition: exists("volta"),
    installers: {
      OSX: voltaInstaller,
      ARCH: voltaInstaller,
    },
  });

const bat = () =>
  install({
    command: "bat",
    condition: exists("bat"),
    installers: {
      OSX: installByBrew("bat"),
      ARCH: installByParu("bat"),
    },
  });

const lsd = () =>
  install({
    command: "lsd",
    condition: exists("lsd"),
    installers: {
      OSX: installByBrew("lsd"),
      ARCH: installByParu("lsd"),
    },
  });
  
const kubectl = () =>
  install({
    command: "kubectl",
    condition: exists("kubectl"),
    installers: {
      OSX: installByBrew("kubernetes-cli"),
      ARCH: installByParu("kubectl-bin"),
    },
  });

const chrome = () =>
  install({
    command: "google-chrome",
    condition: exists("google-chrome-stable"),
    installers: {
      OSX: installByBrewAsCask("google-chrome"),
      ARCH: installByParu("google-chrome libvdpau vdpauinfo"),
    },
  });

const telegram = () =>
  install({
    command: "telegram-desktop",
    condition: exists("telegram-desktop"),
    installers: {
      OSX: installByBrewAsCask("telegram-desktop"),
      ARCH: installByParu("telegram-desktop"),
    },
  });

const slack = () =>
  install({
    command: "slack",
    condition: exists("slack"),
    installers: {
      OSX: installByBrewAsCask("slack"),
      ARCH: installByParu("slack"),
    },
  });

export const installers: (() => Promise<void>)[] = [
  // base
  brew,
  paru,
  baseDevel,
  git,

  // compilers
  // rustup,
  // go,
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
  kubectl,

  // ui
  chrome,
  telegram,
  slack,
  
  // teams ?
];
