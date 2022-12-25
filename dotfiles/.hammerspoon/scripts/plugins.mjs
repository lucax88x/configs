#!/usr/bin/env -S npx zx@latest --experimental

const pluginsDir = `${os.homedir()}/.hammerspoon`;

async function updatePlugin(url, name) {
  await spinner(chalk.blue(`updating ${name}`), async () => {
    const pluginDir = `${pluginsDir}/${name}`;
    if (!fs.exists(pluginDir)) {
      await $`git clone ${url} ${pluginDir}`;
    } else {
      await $`cd ${pluginDir} && git pull`;
    }
  });
}

await updatePlugin("https://github.com/AdamWagner/stackline.git", "stackline");
