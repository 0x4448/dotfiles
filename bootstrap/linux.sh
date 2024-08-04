#!/usr/bin/env bash
set -eu
shopt -s expand_aliases

echo ".dotfiles" > "$HOME/.gitignore"
git clone --bare https://github.com/0x4448/dotfiles "$HOME/.dotfiles"

# Create global gitconfig file
# This prevents unintentional additions to the secondary user gitconfig
if [[ ! -f "$HOME/.gitconfig" ]]; then
  touch "$HOME/.gitconfig"
fi

alias dotfiles='GIT_DIR="$HOME/.dotfiles/" GIT_WORK_TREE="$HOME/"'

dotfiles git checkout --force
dotfiles git config status.showUntrackedFiles no

# Restore GNOME terminal configuration
if echo "$XDG_CURRENT_DESKTOP" | cut -d: -f2 | grep -qi gnome; then
  dconf load /org/gnome/terminal/ < ~/.config/gnome-terminal-profile
fi
