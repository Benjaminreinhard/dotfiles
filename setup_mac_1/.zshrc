
# PROMPT
# ------

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' formats ' %F{yellow}%b%u%c'
zstyle ':vcs_info:*' enable git

PROMPT='%F{green}%~%f%F{yellow}${vcs_info_msg_0_}%f '

# COLORING
# --------

export CLICOLOR=1

# ALIASES
# -------

# General
alias ll='ls -la'
alias rc='vim ~/.zshrc && source ~/.zshrc'
alias ta="tree -I '__pycache__|.git|venv|.venv' -a"

# Git
alias gs='git status'

# Docker
alias d='docker'

alias dcu='d compose up'
alias dcd='d compose down'
alias dcb='d compose build'

# Tmux
alias tcheat='bat ~/.tmux_cheat.md'

# Python
alias activate='source .venv/bin/activate'

# Bat
alias bat='bat --style=plain'


. "$HOME/.local/bin/env"
