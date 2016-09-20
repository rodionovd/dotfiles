#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

ln -s -F -i "$DOTFILES_ROOT"/fonts/Fonts.symlink/* ~/Library/Fonts/
