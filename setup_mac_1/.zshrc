
# PROMPT

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

export CLICOLOR=1

# ALIASES

alias ll='ls -la'
alias gs='git status'

