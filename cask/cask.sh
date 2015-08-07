#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

# Install some OS X apps using Cask
echo "• Installing Homebrew Cask and some apps"
brew install caskroom/cask/brew-cask
for app in "github" "hopper-disassembler" "skype" "the-unarchiver" "transmission" "sketch" "coderunner" "slack" "0xed" "virtualbox" "dropdmg" "atom" "pacifist" "dash" "wwdc" "marked"; do
	brew cask install "${app}"
done

# Also install the latest iTerm2 nightly build (if needed)
if [[ ! -d "/Applications/iTerm.app" ]];
then
	echo "• Installing iTerm2 (latest)"
	brew tap caskroom/versions
	brew cask install iterm2-nightly
	brew untap caskroom/versions
fi
brew cask cleanup
brew cask doctor
