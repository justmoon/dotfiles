#!/usr/bin/env bash

set -e

CHEZMOI_PATH="$(chezmoi source-path)"

# Arch install
if [ -f "/etc/arch-release" ]; then
  which ansible-playbook > /dev/null || sudo pacman -S ansible
  ansible-galaxy collection install -r $CHEZMOI_PATH/setup/arch_requirements.yml
  ansible-playbook -i "localhost," -c local $CHEZMOI_PATH/setup/arch.yml
else
  echo "Current operating system is not supported in dotfiles bootstrap script"
fi


