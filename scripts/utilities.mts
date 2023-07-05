import { spinner } from "zx/experimental";

type DISTROS = "OSX" | "ARCH";

const DISTRO: DISTROS = "OSX";

export function exists(command: string) {
  return async () => !!(await $`command -v ${command}`);
}

export const noop = async () => false;

const debug = true;
export function installByParu(pkg: string) {
  return async () => {
    if (debug) {
      console.debug("would install by paru");
    } else {
      await $`paru -S --noconfirm ${pkg}`;
    }

    return true;
  };
}

export function installByBrew(pkg: string) {
  return async () => {
    if (debug) {
      console.debug("would install by brew");
    } else {
      await $`brew install ${pkg}`;
    }

    return true;
  };
}

export function installByBrewAsCask(pkg: string) {
  return async () => {
    if (debug) {
      console.debug("would install by brew");
    } else {
      await $`brew install --cask ${pkg}`;
    }

    return true;
  };
}

export async function install({
  command,
  condition,
  installers,
}: {
  command: string;
  condition: () => Promise<boolean>;
  installers: Record<DISTROS, () => Promise<boolean>>;
}) {
  if (!(await condition())) {
    console.info(`Installing ${command} for ${DISTRO}`);
    const fn = installers[DISTRO];

    const result = await spinner(command, fn);

    if (result) {
      console.info(`Installed ${command}`);
    } else {
      console.info(`Skipping ${command}`);
    }
  } else {
    console.info(`Already installed ${command}`);
  }
}
