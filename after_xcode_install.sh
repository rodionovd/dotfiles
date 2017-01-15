#!/usr/bin/env bash
#
# This scripts builds and installs stuff that requires Xcode
#

pushd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd)

# Install Homebrew
sh "$DOTFILES_ROOT/Homebrew/brew.sh"

# Setup my favourite text replacements with shortcuts
if [[ -f $(which shortcuts) ]];
then
	shortcuts new --force "shrugg" "¯\_(ツ)_/¯"
	shortcuts new --force "hmhm" "ಠ_ಠ"
	shortcuts new --force "++1" "👍🏼"
fi

popd
