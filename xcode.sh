#!/usr/bin/env bash

PURPLE="\e[1;35m"
CYAN="\e[4;36m"
CLEAR="\e[0m"

printf "• Installing Xcode command-line tools. ${PURPLE}Choose ${CYAN}\"Install\"${CLEAR}${PURPLE} in the pop-up window you'll see.${CLEAR}\n"
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
