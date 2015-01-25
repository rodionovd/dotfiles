#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

# Install oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]];
then
	echo "• Installing oh-my-zsh"
	curl -L http://install.ohmyz.sh | sh
fi

echo "• Backing up an existing .zshrc config"
# Backup an existing .zshrc if any
if [[ -f "$HOME/.zshrc" ]]; then
	mv -v "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi
echo "• Install .zshrc and my custom zsh-theme"
# Symlink .zshrc
ln -s -F -i "$DOTFILES_ROOT/zsh/zshrc.symlink" "$HOME/.zshrc"
# Symlink my own theme (based on nanotech)
ln -s -F -i "$DOTFILES_ROOT/zsh/rodionovd.zsh-theme" "$HOME/.oh-my-zsh/themes/rodionovd.zsh-theme"
