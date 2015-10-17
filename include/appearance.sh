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
RESET="\[\e[0m\]"

# Grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

PROMPT_COMMAND=prompt

if [[ $PLATFORM == 'mac' ]]; then
    # ls colours
    export LSCOLORS='Gxfxcxdxdxegedabagacad'

    # Load bash_completion for __git_ps1
    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
        source "$(brew --prefix)/etc/bash_completion"
        PROMPT_COMMAND=git_prompt
    fi

elif [[ $PLATFORM == 'linux' ]]; then
    # Load bash_git for __git_ps1
    if [ -f "$HOME/.bash_git" ]; then
        pushd "$HOME"
        wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --no-check-certificate
        mv git-prompt.sh .bash_git
        popd
    fi
    source "$HOME/.bash_git"
    PROMPT_COMMAND=git_prompt
fi

# Customize the prompt
prompt () {
    local exit_status=${1:-$?} # Save exit status since the if statments below will change it.
    local host
    local venv
    local git_branch=$2
    local time_section="$GREEN:) $CYAN\D{%H:%M:%S}$RESET"

    if [[ $exit_status != 0 ]]; then
        time_section="$RED:( $YELLOW\D{%H:%M:%S}$RESET$"
    fi

    if [[ -n $SSH_CLIENT ]]; then
        host=@$WHITE$(echo "$HOSTNAME" | cut -d '.' -f 1)$RESET
    fi

    if [[ $VIRTUAL_ENV != '' ]]; then
        venv="$WHITE(${VIRTUAL_ENV##*/}) $RESET"
    fi

    PS1="${venv}${time_section} \u${host}:\W${git_branch}\n $ "
}
git_prompt () {
    prompt $? "$GREEN$(__git_ps1)$RESET"
}
