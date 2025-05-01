#!/usr/bin/env bash

set -eo pipefail
ROOT=$(pwd)

echo "=================================="
echo "Step 1: Configuring macOS"
echo "=================================="

sh "./macos.sh"
# OrbStack/Docker requires Rosetta for x86 containers, let's install it without user interaction
softwareupdate --install-rosetta --agree-to-license

echo "=================================="
echo "Step 2: Installing Homebrew"
echo "=================================="

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle install --file "$ROOT/brew/Brewfile"

echo "=================================="
echo "Step 3: Configuring git & ssh"
echo "=================================="

ln -s -F -f "$ROOT/git/gitconfig" ~/.gitconfig
ln -s -F -f "$ROOT/git/gitignore_global" ~/.gitignore_global

# TODO: wouldn't it be better to symlink the entire .ssh directory?
mkdir -p ~/.ssh
ln -s -F -f "$ROOT/ssh/config" ~/.ssh/config

echo "=================================="
echo "Step 4: Installing oh-my-zsh"
echo "=================================="

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
ln -s -F -f "$ROOT/zsh/zshrc" ~/.zshrc
ln -s -F -f "$ROOT/zsh/rodionovd.zsh-theme" ~/.oh-my-zsh/themes/rodionovd.zsh-theme
# Disable the "Last login" message; see `-q` option in `man login`
touch ~/.hushlogin

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
# Using the full app path here because we've just installed Ghostty and the OS might not have a chance to index it yet
open -a /Applications/Ghostty.app && killall Terminal