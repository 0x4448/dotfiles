# shellcheck disable=SC1090,SC2148

# oh-my-zsh
export HIST_STAMPS="%Y-%m-%dT%H:%M:%SZ"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="ys"

export plugins=(
  git
)

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  # shellcheck disable=SC1091
  source "$ZSH/oh-my-zsh.sh"
fi


# Path
export PATH="$HOME/.local/bin:$PATH"


# Aliases
alias dotfiles='GIT_DIR="$HOME/.dotfiles/" GIT_WORK_TREE="$HOME/"'
alias dfs=dotfiles


# Colors
LS_COLORS="${LS_COLORS}di=01;36:"  # directory: cyan
LS_COLORS="${LS_COLORS}ex=01;31:"  # executable: red
export LS_COLORS


# Environment
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export TZ=UTC


# direnv
if command -v direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi


# Kubernetes
alias k=kubectl
if command -v kubectl > /dev/null; then
  source <(kubectl completion zsh)
fi


# Poetry
export PATH="$HOME/.poetry/bin:$PATH"


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv > /dev/null; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
