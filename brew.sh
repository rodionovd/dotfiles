#!/usr/bin/env bash

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

# Install the required stuff
echo "• Installing Homebrew formulae"
brew install class-dump cloc git rust sqlite valgrind zsh
# Install some OS X apps using Cask
echo "• Installing Homebrew Cask and some apps"
brew install caskroom/cask/brew-cask
brew cask install github hopper-disassembler skype the-unarchiver transmission
