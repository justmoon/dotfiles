#!/usr/bin/env bash

set -e

__HELP="
 \x1b[34m✓\x1b[0m Chezmoi has updated the home directory configuration files.

   To run the basic system setup routines, call:

 \x1b[34m$\x1b[0m theia install

   To run a system upgrade, call:

 \x1b[34m$\x1b[0m theia update
"

echo -e "$__HELP"