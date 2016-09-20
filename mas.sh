#!/usr/bin/env bash

if [[ ! -f $(which mas) ]];
then
	echo "[!] mas is not installed. Install with 'brew cask install mas'"
    exit 1
fi

echo "• Installing apps from Mac App Store"

if [[ $(mas account) == "Not signed in" ]]; then
	mas signin com.rodionov@gmail.com
fi

declare -a apps=(
	847496013  # Deckset
	1024069033 # Veertu
	452840086  # Receigen
)

mas install --force ${apps[@]}
mas upgrade
