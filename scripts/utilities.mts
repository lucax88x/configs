// import { spinner } from "zx/experimental";

export type DISTROS = "OSX" | "ARCH" | "WIN";

export async function askConfirmation(quest: string): Promise<boolean> {
  let confirmation = await question(`${quest} (y)`);

  return confirmation.toLowerCase() === "y";
}

export function exists(command: string) {
  return async () => {
    try {
      let found = await which(command);
      return found !== "";
    } catch (error) {
      return false;
    }
  };
}

export function existsApplicationInOsx(app: string) {
  return async () => {
    try {
      return await fs.exists(`/Applications/${app}.app`);
    } catch (error) {
      return false;
    }
  };
}

export function existsByPwsh(command: string) {
  return async () => !!(await $`command -v ${command}`);
}

export type Installer = [() => Promise<boolean>, () => Promise<boolean>];

export const noop: Installer = [async () => true, async () => false];

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

    if (!(await condition())) {
      if (
        !(await askConfirmation(`are you sure you want to install ${command}?`))
      ) {
        return;
      }

      // const result = await spinner(`installing ${command}`, () => installer());
      console.info(chalk.blue(`installing ${command}`));
      const result = await installer();

      if (result) {
        console.info(chalk.green(`installed ${command}`));
      }
    } else {
      console.info(chalk.grey(`already installed ${command}`));
    }
  };
}
