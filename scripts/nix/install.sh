#!/usr/bin/env bash

INSTALL_FILE="/tmp/nix-install"

# if [ ! -f "$INSTALL_FILE" ]; then
#     curl -L https://nixos.org/nix/install -o "$INSTALL_FILE"
# fi
#

NIX_FIRST_BUILD_UID=30001 NIX_BUILD_GROUP_ID=998 sh "$INSTALL_FILE"
