#!/usr/bin/env zx

/* $.verbose = false */

const { stdout: found_package_jsons } = await $`fd package.json`;

const package_jsons = found_package_jsons.split(/\r?\n|\r|\n/g);

const all_scripts = [];
for (const package_json of package_jsons) {
  if (package_json) {
    let { scripts } = await fs.readJson(package_json);

    const scriptNames = Object.keys(scripts);

    let prefixed = scriptNames.map((script) => {
      const dirName = path.dirname(package_json);
      if (dirName !== ".") {
        return `${dirName}#${script}`;
      } else {
        return script;
      }
    });

    all_scripts.push(...prefixed);
  }
}

const { stdout: selected_script } =
  await $`echo ${all_scripts} | xargs -n1 | fzf`;

const splitted_selected_script = selected_script.split("#");

/* $.verbose = true */

if (splitted_selected_script) {
  if (splitted_selected_script.length === 1) {
    const [script] = splitted_selected_script;
    await $`pnpm run ${script.trim()}`;
  }
  if (splitted_selected_script.length === 2) {
    const [path, script] = splitted_selected_script;
    await $`cd ${path} && pnpm run ${script.trim()}`;
  }
}
