#!/usr/bin/env npx --package=ts-node -- ts-node-esm --swc
import "zx/globals";

import { installers } from "./installers.mts";

for (let i = 0; i < installers.length; i++) {
  const installer = installers[i];

  await installer();
}
