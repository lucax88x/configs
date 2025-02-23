#!/usr/bin/env npx tsx

import "zx/globals";

await $`Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1`;
