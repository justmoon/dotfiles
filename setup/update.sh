#!/usr/bin/env bash

set -e

CHEZMOI_PATH="$(chezmoi source-path)"

# Arch system update
if [ -f "/etc/arch-release" ]; then
  echo 'Update packages'
  yay -Suy

  echo 'Update vim plugins'
  vim +'PlugUpdate --sync' +qa

  echo 'Update vim-CoC plugins'
  vim +CocUpdateSync +qa

  echo 'Update VS Code extensions'
  for ext in `code --list-extensions`
  do 
    code --install-extension "$ext" 
  done
else
  echo "Current operating system is not supported in dotfiles"
fi


