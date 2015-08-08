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

# TODO(rodionovd): install Xcode.app via xcode-install gem:
# 1) sudo gem install xcode-select
# 2) get XCODE_INSTALL_USER and XCODE_INSTALL_PASSWORD from Keychain:
#    /usr/bin/security find-generic-password -wa SOMEKEY
# 3) XCODE_INSTALL_USER="foo" XCODE_INSTALL_PASSWORD="bar" xcode-intall 6.4
