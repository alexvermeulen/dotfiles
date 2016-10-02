#!/usr/bin/env bash

PLATFORM='unknown'
if [[ `uname` == 'Darwin' ]]; then
    PLATFORM='mac'
elif [[ `uname` == 'Linux' ]]; then
    PLATFORM='linux'
fi
export PLATFORM

# Use vi editing mode
# set -o vi

# Use emacs editing mode
set -o emacs

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Set basic path
PATH=/usr/local/sbin:/usr/local/bin:$PATH

# Add RVM to path for scripting
PATH=$HOME/.rvm/bin:$PATH

export PATH

# Set up virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Load dotfiles
if [ -d $HOME/.dotfiles ]; then
    export DOTFILES_DIR="$HOME/.dotfiles"
    for file in $DOTFILES_DIR/include/*
    do
        source $file
    done
fi

export NVM_DIR="/Users/avermeulen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
