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
	installByDnf,
	noop,
	existsFontInUnix,
	installFont,
	installByAsdf,
  installByCargo,
} from "./utilities.mts";

const brew = install({
	command: "brew",
	installers: {
		ARCH: noop,
		DEB: noop,
		WIN: noop,
		OSX: [
			exists("brew"),
			async () => {
				await $`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`;
				await $`brew analytics off`;

				return true;
			},
		],
		FED: noop,
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
		ARCH: [exists("pwsh"), installByParu("powershell")],
		DEB: [exists("pwsh"), installByNala("powershell")],
		FED: noop,
	},
});


const installAsdf = (arch: 'darwin-arm64' | 'linux-arm64') => async () => {
  const ASDF_VERSION = process.env.ASDF_VERSION || 'v0.16.4' 
  const ASDF_INSTALL_DIR = process.env.INSTALL_DIR || '/usr/bin'

  try {
    await $`mkdir -p /tmp/asdf-install`
    cd('/tmp/asdf-install')

    const filename = `asdf-${ASDF_VERSION}-${arch}.tar.gz`
    const downloadUrl = `https://github.com/asdf-vm/asdf/releases/download/${ASDF_VERSION}/${filename}`
    
    console.log(`downloading ASDF ${ASDF_VERSION} for ${arch}...`)
    await $`wget ${downloadUrl}`
    
    await $`mkdir -p ~/.asdf`
    
    console.log('extracting ASDF...')
    await $`tar -xzf ${filename} -C ~/.asdf`

    await $`sudo install -Dm755 ~/.asdf/asdf "${ASDF_INSTALL_DIR}/asdf"`
    
    console.log('cleaning up...')
    await $`rm -rf /tmp/asdf-install`
    
    return true
  } catch (error) {
    console.error('installation failed:', error.message)
    await $`rm -rf /tmp/asdf-install`
    return false
  }
}

const asdf = install({
	command: "asdf",
	installers: {
		WIN: [existsByPwsh("asdf"), installByScoop("asdf")],
		OSX: [exists("asdf"), installByBrew("asdf")],
		ARCH: [exists("asdf"), installByParu("asdf-vm")],
		DEB: noop,
		FED: [ exists("asdf"), installAsdf('linux-arm64')],
	},
});

// const installPnpm = async () => {
// 	await $`curl -fsSL https://get.pnpm.io/install.sh | sh -`;
//
// 	return true;
// };
const installPnpm = installByAsdf(
	"pnpm",
	"10.4.1",
	"https://github.com/jonathanmorley/asdf-pnpm",
);

const pnpm = install({
	command: "pnpm",
	installers: {
		WIN: [existsByPwsh("pnpm"), installPnpm],
		OSX: [exists("pnpm"), installPnpm],
		ARCH: [exists("pnpm"), installPnpm],
		DEB: [exists("pnpm"), installPnpm],
		FED: [exists("pnpm"), installPnpm],
	},
});

const baseDevel = install({
	command: "base-devel (make)",
	installers: {
		WIN: [existsByPwsh("make"), installByScoop("make")],
		OSX: noop,
		ARCH: [exists("make"), installByParu("base-devel")],
		DEB: noop,
		FED: [exists("make"), installByDnf("make")],
	},
});

const gcc = install({
	command: "gcc",
	installers: {
		WIN: noop,
		OSX: noop,
		ARCH: noop,
		DEB: noop,
		FED: [exists("gcc"), installByDnf("gcc")],
	},
});

const git = install({
	command: "git",
	installers: {
		WIN: [existsByPwsh("git"), installByScoop("git")],
		OSX: [exists("git"), installByBrew("git")],
		ARCH: [exists("git"), installByParu("git")],
		DEB: [exists("git"), installByNala("git")],
		FED: [exists("git"), installByDnf("git")],
	},
});

const installZig = installByAsdf(
	"zig",
	"0.13.0",
	"https://github.com/asdf-community/asdf-zig",
);
const zig = install({
	command: "zig",
	installers: {
		WIN: [existsByPwsh("zig"), installZig],
		OSX: [exists("zig"), installZig],
		ARCH: [exists("zig"), installZig],
		DEB: [exists("zig"), installZig],
		FED: [exists("zig"), installZig],
	},
});

const installBun = installByAsdf(
	"bun",
	"1.2.3",
	"https://github.com/cometkim/asdf-bun",
);
const bun = install({
	command: "bun",
	installers: {
		WIN: [existsByPwsh("bun"), installBun],
		OSX: [exists("bun"), installBun],
		ARCH: [exists("bun"), installBun],
		DEB: [exists("bun"), installBun],
		FED: [exists("bun"), installBun],
	},
});

const installNode = installByAsdf(
	"nodejs",
	"22.14.0",
	"https://github.com/asdf-vm/asdf-nodejs",
);
const node = install({
	command: "node",
	installers: {
		WIN: [existsByPwsh("node"), installNode],
		OSX: [exists("node"), installNode],
		ARCH: [exists("node"), installNode],
		DEB: [exists("node"), installNode],
		FED: [exists("node"), installNode],
	},
});

const installRust = installByAsdf(
	"rust",
	"1.85.0",
	"https://github.com/asdf-community/asdf-rust.git",
);
const rust = install({
	command: "rust",
	installers: {
		WIN: noop,
		OSX: [exists("cargo"), installRust],
		ARCH: [exists("cargo"), installRust],
		DEB: [exists("cargo"), installRust],
		FED: [exists("cargo"), installRust],
	},
});

// asdf plugin add golang https://github.com/kennyp/asdf-golang.git
const installGo = installByAsdf(
	"go",
	"1.23.0",
	"https://github.com/kennyp/asdf-golang.git",
);
const go = install({
	command: "go",
	installers: {
		WIN: [existsByPwsh("go"), installGo],
		OSX: [exists("go"), installGo],
		ARCH: [exists("go"), installGo],
		DEB: noop,
		FED: [exists("go"), installGo],
	},
});

const wget = install({
	command: "wget",
	installers: {
		WIN: [existsByPwsh("wget"), installByScoop("wget")],
		OSX: [exists("wget"), installByBrew("wget")],
		ARCH: [exists("wget"), installByParu("wget")],
		DEB: [exists("wget"), installByNala("wget")],
		FED: [exists("wget"), installByDnf("wget")],
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
		FED: [exists("curl"), installByDnf("curl")],
	},
});

const ssh = install({
	command: "ssh",
	installers: {
		WIN: noop,
		OSX: noop,
		ARCH: [exists("ssh-keygen"), installByParu("openssh")],
		DEB: noop,
		FED: [exists("ssh-keygen"), installByDnf("openssh")],
	},
});

const installChezmoi = installByAsdf(
	"chezmoi",
	"2.59.1",
	"https://github.com/joke/asdf-chezmoi",
);
const chezmoi = install({
	command: "chezmoi",
	installers: {
		WIN: [existsByPwsh("chezmoi"), installChezmoi],
		OSX: [exists("chezmoi"), installChezmoi],
		ARCH: [exists("chezmoi"), installChezmoi],
		DEB: [exists("chezmoi"), installChezmoi],
		FED: [ exists("chezmoi"),installChezmoi],
	},
});

const unzip = install({
	command: "unzip",
	installers: {
		WIN: [existsByPwsh("unzip"), installByScoop("unzip")],
		OSX: [exists("unzip"), installByBrew("unzip")],
		ARCH: [exists("unzip"), installByParu("unzip")],
		DEB: [exists("unzip"), installByNala("unzip")],
		FED: [exists("unzip"), installByDnf("unzip")],
	},
});

const zsh = install({
	command: "zsh",
	installers: {
		WIN: noop,
		OSX: noop,
		ARCH: [exists("zsh"), installByParu("zsh")],
		DEB: [exists("zsh"), installByNala("zsh")],
		FED: [exists("zsh"), installByDnf("zsh")],
	},
});

const starship = install({
	command: "starship",
	installers: {
		WIN: noop,
		OSX: [exists("starship"), installByBrew("starship")],
		ARCH: [exists("starship"), installByParu("starship")],
		DEB: [exists("starship"), installByNala("starship")],
		FED: [
			exists("starship"),
			async () => {
				await $`curl -sS https://starship.rs/install.sh | sh`;

				return true;
			},
		],
	},
});

const bat = install({
	command: "bat",
	installers: {
		WIN: [existsByPwsh("bat"), installByScoop("bat")],
		OSX: [exists("bat"), installByBrew("bat")],
		ARCH: [exists("bat"), installByParu("bat")],
		DEB: [exists("bat"), installByNala("bat")],
		FED: [exists("bat"), installByDnf("bat")],
	},
});

const lsd = install({
	command: "lsd",
	installers: {
		WIN: [existsByPwsh("lsd"), installByScoop("lsd")],
		OSX: [exists("lsd"), installByBrew("lsd")],
		ARCH: [exists("lsd"), installByParu("lsd")],
		DEB: [exists("lsd"), installByNala("lsd")],
		FED: [exists("lsd"), installByDnf("lsd")],
	},
});

const fzf = install({
	command: "fzf",
	installers: {
		WIN: [existsByPwsh("fzf"), installByScoop("fzf")],
		OSX: [exists("fzf"), installByBrew("fzf")],
		ARCH: [exists("fzf"), installByParu("fzf")],
		DEB: [exists("fzf"), installByNala("fzf")],
		FED: [exists("fzf"), installByDnf("fzf")],
	},
});

const rg = install({
	command: "ripgrep",
	installers: {
		WIN: [existsByPwsh("rg"), installByScoop("ripgrep")],
		OSX: [exists("rg"), installByBrew("rg")],
		ARCH: [exists("rg"), installByParu("ripgrep-git")],
		DEB: [exists("rg"), installByNala("ripgrep")],
		FED: [exists("rg"), installByDnf("ripgrep")],
	},
});

const delta = install({
	command: "delta",
	installers: {
		WIN: [existsByPwsh("delta"), installByScoop("delta")],
		OSX: [exists("delta"), installByBrew("git-delta")],
		ARCH: [exists("delta"), installByParu("git-delta")],
		DEB: [exists("delta"), installByNala("delta")],
		FED: [exists("delta"), installByDnf("delta")],
	},
});

const fd = install({
	command: "fd",
	installers: {
		WIN: [existsByPwsh("fd"), installByScoop("fd")],
		OSX: [exists("fd"), installByBrew("fd")],
		ARCH: [exists("fd"), installByParu("fd")],
		DEB: [exists("fd"), installByNala("fd")],
		FED: [exists("fd"), installByDnf("fd")],
	},
});

const kubectl = install({
	command: "kubectl",
	installers: {
		WIN: [existsByPwsh("kubectl"), installByScoop("kubectl")],
		OSX: [exists("kubectl"), installByBrew("kubernetes-cli")],
		ARCH: [exists("kubectl"), installByParu("kubectl")],
		DEB: [exists("kubectl"), installByNala("kubernetes-cli")],
		FED: [exists("kubectl"), installByDnf("kubernetes-client")],
	},
});

const zoxide = install({
	command: "zoxide",
	installers: {
		WIN: [existsByPwsh("zoxide"), installByScoop("zoxide")],
		OSX: [exists("zoxide"), installByBrew("zoxide")],
		ARCH: [exists("zoxide"), installByParu("zoxide")],
		DEB: [exists("zoxide"), installByNala("zoxide")],
		FED: [exists("zoxide"), installByDnf("zoxide")],
	},
});

const gh = install({
	command: "gh",
	installers: {
		WIN: [existsByPwsh("gh"), installByScoop("gh")],
		OSX: [exists("gh"), installByBrew("gh")],
		ARCH: [exists("gh"), installByParu("github-client")],
		DEB: [exists("gh"), installByNala("gh")],
		FED: [exists("gh"), installByDnf("gh")],
	},
});

const atuin = install({
	command: "atuin (better c-r)",
	installers: {
		WIN: [exists("atuin"), installByScoop("atuin")],
		OSX: [exists("atuin"), installByBrew("atuin")],
		ARCH: [exists("atuin"), installByParu("atuin")],
		DEB: [exists("atuin"), installByNala("atuin")],
		FED: [
			exists("atuin"),
			async () => {
				await $`curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh`;

				return true;
			},
		],
	},
});

const btop = install({
	command: "btop",
	installers: {
		WIN: noop,
		OSX: [exists("btop"), installByBrew("btop")],
		ARCH: [exists("btop"), installByParu("btop")],
		DEB: [exists("btop"), installByNala("btop")],
		FED: [exists("btop"), installByDnf("btop")],
	},
});

const bob = install({
	command: "bob",
	installers: {
		WIN: [exists("bob"), installByScoop("bob")],
		OSX: [exists("bob"), installByBrew("bob")],
		ARCH: [exists("bob"), installByParu("bob")],
		DEB: [exists("bob"), installByNala("bob")],
		FED: [exists("bob"), installByCargo('https://github.com/MordechaiHadad/bob.git', 'bob')],
	},
});

const yazi = install({
	command: "yazi",
	installers: {
		WIN: [exists("yazi"), installByScoop("yazi")],
		OSX: [exists("yazi"), installByCargo('https://github.com/sxyazi/yazi.git', 'yazi-fm yazi-cli')],
		ARCH: [exists("yazi"), installByParu("yazi")],
		DEB: [exists("yazi"), installByNala("yazi")],
		FED: [exists("yazi"), installByCargo('https://github.com/sxyazi/yazi.git', 'yazi-fm yazi-cli')],
	},
});

const ollama = install({
	command: "ollama",
	installers: {
		WIN: noop,
		OSX: [exists("ollama"), installByBrew("ollama", true)],
		ARCH: noop,
		DEB: noop,
		FED: noop,
	},
});

const hyprland = install({
	command: "hyprland",
	installers: {
		WIN: noop,
		OSX: noop,
		ARCH: [exists("hyprland"), installByParu("hyprland")],
		DEB: noop,
		FED: [
			exists("hyprland"),
			async () => {
				await installByDnf("hyprland")();
				await installByDnf("waybar")();

				return true;
			},
		],
	},
});

const walker = install({
	command: "walker (albert/rofi)",
	installers: {
		WIN: noop,
		OSX: noop,
		ARCH: [exists("walker"), installByParu("walker")],
		DEB: noop,
		FED: [exists("walker"), installByDnf("walker")],
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

const sketchybar = install({
	command: "sketchybar (menubar for osx)",
	installers: {
		WIN: noop,
		OSX: [
			exists("sketchybar"),
			async () => {
				await installByBrew("FelixKratz/formulae/sketchybar")();
				await $`brew services start sketchybar`;

				return true;
			},
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
		FED: [exists("telegram-desktop"), installByDnf("telegram-desktop")],
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
		DEB: [exists("jetbrains-toolbox"), installByNala("jetbrains-toolbox")],
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
		OSX: [exists("docker"), installByBrew("docker", true)],
		ARCH: noop,
		DEB: noop,
		FED: noop,
	},
});

const docker = install({
	command: "docker",
	installers: {
		WIN: noop,
		OSX: noop,
		ARCH: [
			exists("docker"),
			async () => {
				await installByParu("docker")();
				await installByParu("docker-compose")();
				await $`sudo systemctl enable docker.service`;
				await $`sudo systemctl start docker.service`;
				await $`sudo usermod -aG docker $USER`;

				return true;
			},
		],
		DEB: noop,
		FED: [
			exists("docker"),
			async () => {
				await $`sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo`;
				await $`sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`;
				await $`sudo systemctl enable docker`;
				await $`sudo systemctl start docker`;
				await $`sudo usermod -aG docker $USER`;

				return true;
			},
		],
	},
});

const wezterm = install({
	command: "wezterm",
	installers: {
		WIN: [exists("wezterm"), installByScoop("wezterm")],
		OSX: [existsApplicationInOsx("Wezterm"), installByBrew("wezterm", true)],
		ARCH: [exists("wezterm"), installByParu("wezterm")],
		DEB: [exists("wezterm"), installByNala("wezterm")],
		FED: [exists("wezterm"), installByNala("wezterm")],
	},
});

const kitty = install({
	command: "kitty",
	installers: {
		WIN: noop,
		OSX: [existsApplicationInOsx("kitty"), installByBrew("kitty", true)],
		ARCH: [exists("kitty"), installByParu("kitty")],
		DEB: [exists("kitty"), installByNala("kitty")],
		FED: [exists("kitty"), installByDnf("kitty")],
	},
});

const neovide = install({
	command: "neovide",
	installers: {
		WIN: noop,
		OSX: [existsApplicationInOsx("Neovide"), installByBrew("neovide", true)],
		ARCH: [exists("neovide"), installByParu("neovide")],
		DEB: [exists("neovide"), installByNala("neovide")],
		FED: [exists("neovide"), installByNala("neovide")],
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
	command: "bartender (menubar arrange)",
	installers: {
		WIN: noop,
		OSX: [
			existsApplicationInOsx("Bartender 5"),
			installByBrew("bartender", true),
		],
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

const tgPro = install({
	command: "tg pro (thermal monitor for osx)",
	installers: {
		WIN: noop,
		OSX: [existsApplicationInOsx("Tg Pro"), installByBrew("tg-pro", true)],
		ARCH: noop,
		DEB: noop,
		FED: noop,
	},
});

const daisyDisk = install({
	command: "daisy disk (disk size check)",
	installers: {
		WIN: noop,
		OSX: [
			existsApplicationInOsx("DaisyDisk"),
			installByBrew("daisydisk", true),
		],
		ARCH: noop,
		DEB: noop,
		FED: noop,
	},
});

const dropbox = install({
	command: "dropbox",
	installers: {
		WIN: noop,
		OSX: [existsApplicationInOsx("Dropbox"), installByBrew("dropbox", true)],
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

const karabiner = install({
	command: "karabiner",
	installers: {
		WIN: noop,
		OSX: [
			existsApplicationInOsx("Karabiner-Elements"),
			installByBrew("karabiner-elements", true),
		],
		ARCH: noop,
		DEB: noop,
		FED: noop,
	},
});

const office = install({
	command: "microsoft office",
	installers: {
		WIN: noop,
		OSX: [
			existsApplicationInOsx("Microsoft Outlook"),
			installByBrew("microsoft-office", true),
		],
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
	command: "flow-launcher",
	installers: {
		WIN: [exists("flow-launcher"), installByScoop("flow-launcher")],
		OSX: noop,
		ARCH: noop,
		DEB: noop,
		FED: noop,
	},
});

const cygwin = install({
	command: "cygwin",
	installers: {
		WIN: [exists("cywin"), installByScoop("cygwin")],
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
			installByNala("font-jetbrains-mono"),
		],
		FED: [
			existsFontInUnix("JetBrainsMono"),
			installFont(
				"https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip",
			),
		],
	},
});

const hackNerdFont = install({
	command: "hack nerd font",
	installers: {
		WIN: noop,
		OSX: [
			existsFontInUnix("HackNerdFont"),
			installByBrew("font-hack-nerd-font", true),
		],
		ARCH: [existsFontInUnix("HackNerdFont"), installByParu("ttf-hack-nerd")],
		DEB: [
			existsFontInUnix("HackNerdFont"),
			installByNala("font-hack-nerd-font"),
		],
		FED: [
			existsFontInUnix("HackNerdFont"),
			installByDnf("font-hack-nerd-font"),
		],
	},
});

const sfPro = install({
	command: "san francisco pro font",
	installers: {
		WIN: noop,
		OSX: [existsFontInUnix("SF Pro"), installByBrew("font-sf-pro", true)],
		ARCH: noop,
		DEB: noop,
		FED: noop,
	},
});

export const installers: ((distro: DISTROS) => Promise<void>)[] = [
	// base
	brew,
	paru,
	scoop,
	nala,
	pwsh,
	asdf,
	baseDevel,
	git,

	// tools
	coreutils,
	wget,
	curl,
	ssh,
  
	// dev
	pnpm,
	zig,
	bun,
  node,
	rust,
	go,

  // sh
	zsh,
	starship,
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
	yazi,
	ollama,

	// i3
	hyprland,
	walker,

	aerospace,
	// sketchybar,
	// kde?

	// ui
	chrome,
	edge,
	telegram,
	whatsapp,
	slack,
	jetbrainsToolbox,
	sublimeMerge,
	dockerDesktop,
	docker,
	// wezterm,
	kitty,
	neovide,
	raycast,
	stats,
	karabiner,
	office,
	bartender,
	contexts,
	tgPro,
	daisyDisk,
	dropbox,
	obsidian,
	switcheroo,
	// keypirinha,
	flowLauncher,
	cygwin,

	fontconfig,
	roboto,
	jetbrainsMono,
	hackNerdFont,
	sfPro,
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
