#!/usr/bin/env bash

pushd "$(dirname "$0")"

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

echo "• Install Xcode color themes"
rm -rf ~/Library/Developer/Xcode/UserData/FontAndColorThemes
mkdir -p ~/Library/Developer/Xcode/UserData

ln -s -F -i ./FontAndColorThemes.symlink ~/Library/Developer/Xcode/UserData/FontAndColorThemes

echo "• Opening https://developer.apple.com/downloads/ so you can download the latest Xcode app"
open https://developer.apple.com/downloads/

# Also install Xcode.app itself via `xcode-install` by Boris Bügling:
# https://github.com/neonichu/xcode-install

# XCODES_TO_INSTALL=("8.0")
#
# USER=$(/usr/bin/security find-generic-password -wa "XCODE_INSTALL_USER")
# if [[ $? == 0 ]]; then
#     PASS=$(/usr/bin/security find-generic-password -wa "XCODE_INSTALL_PASSWORD")
#     if [[ $? == 0 ]]; then
#         sudo gem install --no-document xcode-install
#         for version in "${XCODES_TO_INSTALL[@]}"
#         do
#             XCODE_INSTALL_USER="$USER" XCODE_INSTALL_PASSWORD="$PASS" xcode-install install --verbose "$version"
#         done
#         xcode-install cleanup
#     fi
# fi

popd
