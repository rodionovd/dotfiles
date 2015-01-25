#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)


if [[ ! -d "/Applications/iTerm.app" ]];
then
	# Install the latest iTerm2 nightly build available
	echo "• Installing iTerm2 (latest)"
	brew cask install "$DOTFILES_ROOT/iterm2/iterm2-nightly.rb"
# else
	# Oops, what if user is using iTerm for running this script?
	# killall iTerm
fi

echo "• Installing iTerm2 Preferences"
# Symlink com.googlecode.iterm2.plist
ln -s -F -i "$DOTFILES_ROOT/iterm2/com.googlecode.iterm2.plist" \
            "$HOME/Library/Preferences/com.googlecode.iterm2.plist"
