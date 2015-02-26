#!/usr/bin/env bash

# Appearance - compliments of Mark Story

# Colours
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
BR_RED="\[\033[1;31m\]"
BR_MAGENTA="\[\033[1;35m\]"
RESET="\[\033[0m\]"

# Grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# ls colours
if [[ $PLATFORM == 'mac' ]]; then
    export LSCOLORS='Gxfxcxdxdxegedabagacad'
fi

if [[ `__git_ps1` == *'command not found'* ]]; then
    # Load bash_completion for __git_ps1
    echo "Error: The use of __git_ps1 is required for prompt customization."
fi

# Customize the prompt
function exitstatus {
    if [[ -n $SSH_CLIENT ]]; then
        HOST=@$WHITE`echo $HOSTNAME | cut -d '.' -f 1`$RESET
    else
        HOST=''
    fi

    if [ $? -eq 0 ]
    then
        PS1="$GREEN:)$RESET $CYAN\D{%H:%M:%S}$RESET \u$HOST:\W$GREEN$(__git_ps1)$RESET\n\[\e[0m\]\$ "
    else
        PS1="$RED:($RESET $YELLOW\D{%H:%M:%S}$RESET \u$HOST:\W$GREEN$(__git_ps1)$RESET\n\[\e[0m\]\$ "
    fi
}
PROMPT_COMMAND=exitstatus

