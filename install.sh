#!/usr/bin/env bash

set -eo pipefail
ROOT=$(pwd)

echo "=================================="
echo "Step 1: Configuring macOS defaults"
echo "=================================="

sh "./macos.sh"

# brew (this will also install xcode command line tools & git?)
echo "=================================="
echo "Step 2: Installing Homebrew"
echo "=================================="

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle install --file "$ROOT/brew/Brewfile"

echo "=================================="
echo "Step 3: Configuring git"
echo "=================================="

ln -s -F -f "$ROOT/git/gitconfig" ~/.gitconfig
ln -s -F -f "$ROOT/git/gitignore_global" ~/.gitignore_global

echo "=================================="
echo "Step 4: Installing oh-my-zsh"
echo "=================================="

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s -F -f "$ROOT/zsh/zshrc" ~/.zshrc
ln -s -F -f "$ROOT/zsh/rodionovd.zsh-theme" ~/.oh-my-zsh/themes/rodionovd.zsh-theme

echo "=================================="
echo "Step 5: Configuring Ghostty"
echo "=================================="

mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
ln -s -F -f "$ROOT/ghostty/config" ~/Library/Application\ Support/com.mitchellh.ghostty/config

echo "=================================="
echo "Step 6: Configuring code editors"
echo "=================================="

ln -s -F -f "$ROOT/vim/vim_dir" ~/.vim
ln -s -F -f "$ROOT/vim/vimrc" ~/.vimrc

mkdir -p ~/Library/Application\ Support/Code/User/
ln -s -F -f "$ROOT/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json

echo "=================================="
echo "Fin: Bye Terminal, hello Ghostty"
echo "=================================="
open -a Ghostty && killall Terminal