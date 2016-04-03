#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

brew cask doctor

# Install some OS X apps using Cask
echo "• Installing Homebrew Cask and some apps"
brew install caskroom/cask/brew-cask
for app in "github-desktop" "hopper-disassembler" "skype" "the-unarchiver" "transmission" "sketch" "coderunner" "slack" "0xed" "virtualbox" "dropdmg" "atom" "pacifist" "dash" "wwdc" "marked" "vlc" "hammerspoon" "firefox" "paw" "hex-fiend" "gpgtools"; do
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
