#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

SUBLIME_USER_PACKAGES="$HOME/Library/Application Support/Sublime Text 2/Packages/User/"
if [[ ! -d "$SUBLIME_USER_PACKAGES" ]]; then
	brew cask install sublime-text
	open -g "https://packagecontrol.io/installation"
	open -a -g "Sublime Text 2"
	echo "Sublime: Install Package Control, quit the app and start this script again."
	exit 0
fi

echo "• Installing Sublime Text 2 Preferences and Themes"
# Symlink Preferences.sublime-settings
ln -s -F -i "$DOTFILES_ROOT/sublime/Preferences.sublime-settings" \
            "$SUBLIME_USER_PACKAGES/Preferences.sublime-settings"
# Symlink Theme - Spacegray
ln -s -F -i "$DOTFILES_ROOT/sublime/Theme - Spacegray" "$SUBLIME_USER_PACKAGES/Theme - Spacegray"
