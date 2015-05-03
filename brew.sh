#!/usr/bin/env bash

# Install or update Homebrew
if [[ ! -f $(which brew) ]];
then
	echo "• Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "• Updating Homebrew"
	brew update
	brew upgrade --all
	brew cleanup
fi

# Install the required stuff
echo "• Installing Homebrew formulae"
for formulae in "class-dump" "git" "zsh" "rust" "sqlite" "cloc" "valgrind"; do
	brew install "${formulae}"
done
