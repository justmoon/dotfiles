#!/usr/bin/env bash

set -e

__HELP="
 \x1b[34m✓\x1b[0m Chezmoi has updated the home directory configuration files.
   
   You may want to edit \x1b[1m~/.config/chezmoi/chezmoi.toml\x1b[0m to configure these
   dotfiles for this machine. Then run \x1b[1mchezmoi apply\x1b[0m to apply.

   To run the basic system setup routines, call:

 \x1b[34m$\x1b[0m theia install

   To run a system upgrade, call:

 \x1b[34m$\x1b[0m theia update
"

echo -e "$__HELP"