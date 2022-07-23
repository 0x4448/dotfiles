#!/usr/bin/env bash

cd "$HOME" || exit
echo ".dotfiles" > "$HOME/.gitignore"
git clone --bare https://github.com/0x4448/dotfiles .dotfiles

alias config='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME/"'

config checkout --force
config config status.showUntrackedFiles no
