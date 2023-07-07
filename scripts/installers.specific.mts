import { Installer } from "./utilities.mjs";

const email = "lucax88x@gmail.com";

const createSshKey = (type: string, output: string) => async () => {
  await $`ssh-keygen -t ${type} -f ${output} -C "${email}" -P ""`;
  await $`eval "$(ssh-agent -s)"`;
  await $`ssh-add ${output}`;

  return true;
};

export const createEd25119SshKey = [
  () => fs.exists("~/.ssh/id_ed25519"),
  createSshKey("ed25519", "~/.ssh/id_ed25519"),
] satisfies Installer;
