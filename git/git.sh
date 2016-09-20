#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

echo "• Installing global .gitignore"
ln -s -F -i "$DOTFILES_ROOT/git/gitignore_global.symlink" "$HOME/.gitignore_global"

echo "• Installing .gitconfig"
ln -s -F -i "$DOTFILES_ROOT/git/gitconfig.symlink" "$HOME/.gitconfig"
