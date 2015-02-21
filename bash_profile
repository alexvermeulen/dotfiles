#!/usr/bin/env bash

# Use vi editing mode
set -o vi

# Load bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Set basic path
PATH=/usr/local/sbin:/usr/local/bin:$PATH

# Add RVM to path for scripting
PATH=$HOME/.rvm/bin:$PATH

export PATH
export DOTFILES_DIR="$HOME/.dotfiles"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=/Volumes/Projects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# Load local configuration for this machine
if [ -f local_config.sh ]; then
    source local_config.sh
fi

# Load dotfiles
for file in $DOTFILES_DIR/include/*
do
    . $file
done


