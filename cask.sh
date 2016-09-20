#!/usr/bin/env bash

brew doctor

# Install some OS X apps using Cask
echo "• Installing Homebrew Cask and some apps"
brew install caskroom/cask/brew-cask
for app in "iterm2" "github-desktop" "hopper-disassembler" "skype" "the-unarchiver" "transmission" "sketch" "coderunner" "slack" "0xed" "virtualbox" "dropdmg" "atom" "pacifist" "dash" "wwdc" "marked" "vlc" "hammerspoon" "firefox" "paw" "hex-fiend" "gpgtools" "rb-app-checker-lite"; do
	brew cask install "${app}"
done

brew cask cleanup
