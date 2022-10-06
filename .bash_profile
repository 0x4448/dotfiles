if [[ -f /usr/bin/zsh.exe ]]; then
  zsh
elif [[ -f /usr/bin/bash.exe ]]; then
  source "$HOME/.zshrc"
fi
