#!/usr/bin/env bash

PURPLE="\e[1;35m"
CYAN="\e[4;36m"
CLEAR="\e[0m"

printf "• Installing Xcode command-line tools. ${PURPLE}Choose ${CYAN}\"Install\"${CLEAR}${PURPLE} in the pop-up window you'll see.${CLEAR}\n"
xcode-select --install
