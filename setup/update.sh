#!/usr/bin/env bash

set -e

usage() {
  __USAGE="
 \x1b[34m▶\x1b[0m Updates all system software to the latest versions.

   \x1b[1mUSAGE\x1b[0m
 \x1b[34m$\x1b[0m theia update

"
  echo -e "$__USAGE" 1>&2 
}

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

# Arch system update
if [ -f "/etc/arch-release" ]; then
  echo 'Update packages'
  yay -Suy

  if command -v flatpak &> /dev/null
  then
    echo 'Update Flatpak apps'
    flatpak update
  fi

  if command -v nvim &> /dev/null
  then
    echo 'Update Neovim plugins (PackerSync)'
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  fi
else
  echo "Current operating system is not supported in dotfiles"
fi


