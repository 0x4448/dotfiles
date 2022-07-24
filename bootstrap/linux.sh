#!/usr/bin/env bash

cd "$HOME" || exit
echo ".dotfiles" > "$HOME/.gitignore"
git clone --bare https://github.com/0x4448/dotfiles .dotfiles

# Create global gitconfig file
# This prevents unintentional additions to the secondary user gitconfig
if [[ ! -f "$HOME/.gitconfig" ]]; then
  touch "$HOME/.gitconfig"
fi

alias dotfiles='GIT_DIR="$HOME/.dotfiles/" GIT_WORK_TREE="$HOME/"'

dotfiles git checkout --force
dotfiles git config status.showUntrackedFiles no
