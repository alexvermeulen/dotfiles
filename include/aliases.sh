#!/usr/bin/env bash

# Aliases

# bundle exec
alias be='bundle exec'

# Mac Specific
if [[ $PLATFORM == 'mac' ]]; then

    # ls
    alias ls='ls -Gp'
    alias ll='ls -AGhl'

	# vim
	alias vim='mvim -v'
	alias vimdiff='mvim -v -d'

	# Show/hide files on mac
	alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
	alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

elif [[ $PLATFORM == 'linux' ]]; then

    # ls
    alias ls='ls -Gp --color'
    alias ll='ls -AGhl --color'
fi

