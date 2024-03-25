// import { spinner } from "zx/experimental";

export type DISTROS = "OSX" | "ARCH" | "WIN" | "DEB";

export async function askConfirmation(quest: string): Promise<boolean> {
  let confirmation = await question(`${quest} (y)`);

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

    const conditionOutput = await condition();

    switch (conditionOutput) {
      case "not exists":
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
