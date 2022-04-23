#!/usr/bin/env bash

set -e

usage() {
  __USAGE="
 \x1b[34m▶\x1b[0m Installs and configures the system.

   \x1b[1mUSAGE\x1b[0m
 \x1b[34m$\x1b[0m theia install [OPTIONS]

"
  echo -e "$__USAGE" 1>&2 
}

CHEZMOI_PATH="$(chezmoi source-path)"

while (( "$#" )); do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *)
      echo "Error: Unexpected parameter: $1" >&2
      usage
      exit 1
      ;;
  esac
  shift
done

exit 1
# Make sure sudo password is cached
sudo true

# Arch install
if [ -f "/etc/arch-release" ]; then
  which ansible-playbook > /dev/null || sudo pacman -S ansible
  ansible-galaxy collection install --requirements-file $CHEZMOI_PATH/setup/arch_requirements.yml
  ansible-playbook --inventory "localhost," --connection local --become-method=sudo $CHEZMOI_PATH/setup/arch.yml
else
  echo "Current operating system is not supported in dotfiles"
fi


