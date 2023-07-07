#!/usr/bin/env npx --package=ts-node -- ts-node-esm --swc
import "zx/globals";

// suppress stdout
$.verbose = true;

import { installAll } from "./installers.mts";

installAll();
