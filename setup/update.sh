#!/usr/bin/env bash

set -e

CHEZMOI_PATH="$(chezmoi source-path)"

# Make sure sudo password is cached
sudo true

# Arch install
if [ -f "/etc/arch-release" ]; then
  which ansible-playbook > /dev/null || { echo "Ansible not installed, did you forget to run 'theia install'?" ; exit 1 ; }
  ansible-playbook -i "localhost," -c local --become-method=sudo $CHEZMOI_PATH/setup/arch_update.yml
else
  echo "Current operating system is not supported in dotfiles"
fi


