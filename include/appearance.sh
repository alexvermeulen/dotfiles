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

if [[ $PLATFORM == 'mac' ]]; then
    # ls colours
    export LSCOLORS='Gxfxcxdxdxegedabagacad'

    # Load bash_completion for __git_ps1
    if [ ! -f $(brew --prefix)/etc/bash_completion ]; then
        brew install bash-completion
    fi
    source $(brew --prefix)/etc/bash_completion

elif [[ $PLATFORM == 'linux' ]]; then
    # Load bash_git for __git_ps1
    if [ ! -f $HOME/.bash_git ]; then
        pushd $HOME
        wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
        mv git-prompt.sh .bash_git
        popd
    fi
    source $HOME/.bash_git
fi

# Customize the prompt
function exitstatus {
    if [[ -n $SSH_CLIENT ]]; then
        host=@$WHITE`echo $HOSTNAME | cut -d '.' -f 1`$RESET
    else
        host=''
    fi

    if [[ $VIRTUAL_ENV != '' ]]; then
        venv="$WHITE(${VIRTUAL_ENV##*/}) $RESET"
    else
        venv=''
    fi

    if [ $? -eq 0 ]
    then
        PS1="${venv}$GREEN:)$RESET $CYAN\D{%H:%M:%S}$RESET \u${host}:\W$GREEN$(__git_ps1)$RESET\n\[\e[0m\]\$ "
    else
        PS1="${venv}$RED:(${venv}$RESET $YELLOW\D{%H:%M:%S}$RESET \u${host}:\W$GREEN$(__git_ps1)$RESET\n\[\e[0m\]\$ "
    fi
}
PROMPT_COMMAND=exitstatus

