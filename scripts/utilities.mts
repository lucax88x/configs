// import { spinner } from "zx/experimental";

export type DISTROS = "OSX" | "ARCH" | "WIN" | "DEB" | "FED";

export async function askConfirmation(quest: string): Promise<boolean> {
	const confirmation = await question(`${quest} (y)`);

	return confirmation.toLowerCase() === "y";
}

export function exists(command: string) {
	return async (): Promise<Condition> => {
		try {
			const found = await which(command);
			return toCondition(found !== "");
		} catch (error) {
			return "not exists";
		}
	};
}

export function existsApplicationInOsx(app: string) {
	return async (): Promise<Condition> => {
		try {
			return toCondition(await fs.exists(`/Applications/${app}.app`));
		} catch (error) {
			return "not exists";
		}
	};
}

export function existsByPwsh(command: string) {
	return async (): Promise<Condition> => {
		try {
			return toCondition(!!(await $`command -v ${command}`));
		} catch (error) {
			return "not exists";
		}
	};
}

export function existsFontInUnix(font: string) {
	return async (): Promise<Condition> => {
		try {
			return toCondition(!!(await $`fc-list | grep -i ${font}`));
		} catch (error) {
			return "not exists";
		}
	};
}

export function existsInFlatpak(pkg: string) {
	return async (): Promise<Condition> => {
		try {
			return toCondition(!!(await $`flatpak list | grep -i ${pkg}`));
		} catch (error) {
			return "not exists";
		}
	};
}

export type Installer = [() => Promise<Condition>, () => Promise<boolean>];
export type Condition = "exists" | "not exists" | "skipped";
export const toCondition = (bool: boolean): Condition =>
	bool ? "exists" : "not exists";

export const noop: Installer = [async () => "skipped", async () => false];

const debug = false;
export function installByParu(pkg: string) {
	return async () => {
		if (debug) {
			console.info(chalk.red("would install by paru"));
			await $`sleep 1`;
			return true;
		}

		$.verbose = true;
		await $`paru -S --noconfirm ${pkg}`;

		return true;
	};
}

export function installByApt(pkg: string) {
	return async () => {
		if (debug) {
			console.info(chalk.red("would install by apt"));
			await $`sleep 1`;
			return true;
		}

		$.verbose = true;
		await $`sudo apt install -y ${pkg}`;

		return true;
	};
}

export function installByNala(pkg: string) {
	return async () => {
		if (debug) {
			console.info(chalk.red("would install by nala"));
			await $`sleep 1`;
			return true;
		}

		$.verbose = true;
		await $`sudo nala install -y ${pkg}`;

		return true;
	};
}

export function installByFlatpak(
	pkg: string,
	external?: { name: string; url: string },
) {
	return async () => {
		if (debug) {
			console.info(chalk.red("would install by flatpak"));
			await $`sleep 1`;
			return true;
		}

		$.verbose = true;

		if (external) {
			await $`flatpak remote-add --user --if-not-exists ${external.name} ${external.url}`;
		}

		await $`flatpak install -y ${pkg}`;

		return true;
	};
}

export function installByDnf(pkg: string, copr?: string) {
	return async () => {
		if (debug) {
			console.info(chalk.red("would install by dnf"));
			await $`sleep 1`;
			return true;
		}

		$.verbose = true;

		if (copr) {
			await $`sudo dnf copr enable ${copr}`;
		}

		await $`sudo dnf install -y ${pkg}`;

		return true;
	};
}

export function installFont(url: string) {
	return async () => {
		$.verbose = true;
		const zipName = url.split("/").pop() || "font.zip";
		const folderName = zipName.replace(".zip", "");

		await $`curl -L ${url} -o ~/Downloads/${zipName}`;
		await $`unzip ~/Downloads/${zipName} -d ~/Downloads/${folderName}`;
		await $`rm ~/Downloads/${zipName}`;
		await $`mkdir -p ~/.local/share/fonts`;
		await $`find . ~/Downloads/${folderName} -e ttf -e otf -exec cp {} ~/.local/share/fonts \;`;
		await $`fc-cache -f -v`;
		await $`rm -rf ~/Downloads/${folderName}`;

		return true;
	};
}

export function installByBrew(pkg: string, asCask: boolean = false) {
	return async () => {
		if (debug) {
			console.info(chalk.red("would install by brew"));
			await $`sleep 1`;
			return true;
		}

		$.verbose = true;
		if (asCask) {
			await $`brew install --cask ${pkg}`;
		} else {
			await $`brew install ${pkg}`;
		}

		return true;
	};
}

export function installByScoop(pkg: string) {
	return async () => {
		if (debug) {
			console.info(chalk.red("would install by scoop"));
			await $`sleep 2`;
			return true;
		}

		$.verbose = true;
		await $`scoop install ${pkg}`;

		return true;
	};
}

export function installByAsdf(pkg: string, version: string, plugin: string) {
	return async () => {
		if (debug) {
			console.info(chalk.red("would install by asdf"));
			await $`sleep 1`;
			return true;
		}

		$.verbose = true;

		await $`asdf plugin add ${pkg} ${plugin}`;
		await $`asdf install ${pkg} ${version}`;
		await $`asdf set -u ${pkg} ${version}`;

		return true;
	};
}

export function installByCargo(repository: string, packages?: string) {
	return async () => {
		if (debug) {
			console.info(chalk.red("would install by cargo"));
			await $`sleep 1`;
			return true;
		}

		$.verbose = true;

		if (packages) {
			await $`cargo install --locked --git ${repository} ${packages.split(" ")}`;
		} else {
			await $`cargo install --locked --git ${repository}`;
		}

		return true;
	};
}

export function install({
	command,
	installers,
}: {
	command: string;
	installers: Record<DISTROS, Installer>;
}) {
	return async (distro: DISTROS) => {
		console.info(chalk.blue(`checking ${command}`));

		const [condition, installer] = installers[distro];

		const conditionOutput = await condition();

		switch (conditionOutput) {
			case "not exists": {
				if (
					!(await askConfirmation(
						`are you sure you want to install ${command}?`,
					))
				) {
					return;
				}

				// const result = await spinner(`installing ${command}`, () => installer());
				console.info(chalk.blue(`installing ${command}`));
				const result = await installer();

				if (result) {
					console.info(chalk.green(`installed ${command}`));
				}
				break;
			}

			case "exists":
				console.info(chalk.grey(`already installed ${command}`));
				break;

			default:
			case "skipped":
				console.info(chalk.grey(`skipping ${command}`));
				break;
		}
	};
}
