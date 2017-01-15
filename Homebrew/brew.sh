#!/usr/bin/env bash

pushd "$(dirname "$0")"

# Install or update Homebrew
if [[ ! -f $(which brew) ]];
then
	echo "• Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "• Updating Homebrew"
	brew update
	brew upgrade
	brew cleanup
fi

# Install the required stuff from Brewfile
brew bundle

popd
