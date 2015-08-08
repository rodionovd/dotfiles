#!/usr/bin/env bash

printf "• Installing Xcode command-line tools.\n"
xcode-select --install

# Credits to Bryan Goldstein:
# see https://gist.github.com/brysgo/9007731
sleep 1
sudo osascript <<EOD
  tell application "System Events"
    tell process "Install Command Line Developer Tools"
      keystroke return
      click button "Agree" of window "License Agreement"
    end tell
  end tell
EOD

# Also install Xcode.app itself via `xcode-install` by Boris Bügling:
# https://github.com/neonichu/xcode-install
XCODE_TO_INSTALL="6.4"

USER=$(/usr/bin/security find-generic-password -wa "XCODE_INSTALL_USER")
if [[ $? == 0 ]]; then
	PASS=$(/usr/bin/security find-generic-password -wa "XCODE_INSTALL_PASSWORD")
	if [[ $? == 0 ]]; then
		XCODE_INSTALL_USER="$USER" XCODE_INSTALL_PASSWORD="$PASS" xcode-install install "$XCODE_TO_INSTALL"
	fi
fi
