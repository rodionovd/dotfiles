#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

echo "• Setting up git credentials"
GIT_AUTHOR_NAME="Dmitry Rodionov"
GIT_AUTHOR_EMAIL="i.am.rodionovd@gmail.com"

GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"

GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

echo "• Installing global .gitignore"
ln -s -F -i "$DOTFILES_ROOT/git/gitignore_global.symlink" "$HOME/.gitignore_global"

echo "• Installing .gitconfig"
ln -s -F -i "$DOTFILES_ROOT/git/gitconfig.symlink" "$HOME/.gitconfig"
