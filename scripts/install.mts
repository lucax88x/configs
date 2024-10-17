#!/usr/bin/env bunx tsx

import "zx/globals";

// suppress stdout
$.verbose = true;

import { installAll } from "./installers.mts";

installAll();
