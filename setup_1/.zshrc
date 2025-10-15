
# PROMPT

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

export CLICOLOR=1

setopt PROMPT_SUBST
PROMPT='%F{green}%~%f %F{yellow}${vcs_info_msg_0_}%f$ '

# ALIASES

alias ll='ls -la'
alias gs='git status'

