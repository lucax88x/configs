#!/usr/bin/env npx tsx

import "zx/globals";

// suppress stdout
$.verbose = true;

import { installAll } from "./installers.mts";

installAll();
