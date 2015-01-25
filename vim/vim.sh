#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

# Create new or backup an existing .vim directory
echo "• Backing up ~/.vim directory"
VIMDIR=$HOME/.vim
if [[ ! -d "$VIMDIR" ]];
then
	mkdir "$VIMDIR"
else
	mv -v "$HOME/.vim" "$HOME/.vim.bak"
fi
echo "• Backing up ~/.vimrc file"
# Backup an existing .vimrc if any
if [[ -f "$HOME/.vimrc" ]]; then
	mv -v "$HOME/.vimrc" "$HOME/.vimrc.bak"
fi
echo "• Installing .vim and .vimrc"
# Symlink .vimrc
ln -s -F -i "$DOTFILES_ROOT/vim/vimrc.symlink" "$HOME/.vimrc"
# Symlink .vim
ln -s -F -i "$DOTFILES_ROOT/vim/vim.symlink" "$HOME/.vim"
