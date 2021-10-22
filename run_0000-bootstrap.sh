#!/usr/bin/env bash

set -e

CHEZMOI_PATH="$(chezmoi source-path)"

# Arch install
if [ -f "/etc/arch-release" ]; then
  which ansible-playbook > /dev/null || sudo pacman -S ansible
  ansible-playbook -i "localhost," -c local --become-method=sudo $CHEZMOI_PATH/setup/arch.yml
else
  echo "Current operating system is not supported in dotfiles bootstrap script"
fi


