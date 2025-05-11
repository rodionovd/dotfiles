#!/usr/bin/env bash
# FIY: a good guide on various brackets https://dev.to/rpalo/bash-brackets-quick-reference-4eh6

set -eo pipefail
ROOT=$(pwd)

echo "=================================="
echo "Step 1: Configuring macOS"
echo "=================================="
(
    # Vital user defaults
    sh "./macos.sh"
    # OrbStack/Docker requires Rosetta for x86 containers, let's install it without user interaction
    softwareupdate --install-rosetta --agree-to-license
)

echo "=================================="
echo "Step 2: Installing Homebrew"
echo "=================================="
(
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ln -s -F -f "$ROOT/apps/brew/aliases" ~/.brew-aliases
    brew bundle install --file "$ROOT/apps/brew/Brewfile" || true
    brew cleanup --prune=all
)

echo "=================================="
echo "Step 3: Configuring git & ssh"
echo "=================================="
(
    ln -s -F -f "$ROOT/git/gitconfig" ~/.gitconfig
    ln -s -F -f "$ROOT/git/gitignore_global" ~/.gitignore_global
    # TODO: wouldn't it be better to symlink the entire .ssh directory?
    mkdir -p ~/.ssh
    ln -s -F -f "$ROOT/ssh/config" ~/.ssh/config
)

echo "=================================="
echo "Step 4: Installing oh-my-zsh"
echo "=================================="
(
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    ln -s -F -f "$ROOT/zsh/zshrc" ~/.zshrc
    ln -s -F -f "$ROOT/zsh/rodionovd.zsh-theme" ~/.oh-my-zsh/themes/rodionovd.zsh-theme
    # Disable the "Last login" message; see `-q` option in `man login`
    touch ~/.hushlogin
)

echo "=================================="
echo "Step 5: Configuring apps"
echo "=================================="

# Ghostty
(
    mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
    ln -s -F -f "$ROOT/apps/ghostty/config" ~/Library/Application\ Support/com.mitchellh.ghostty/config
)
# vim
(
    ln -s -F -f "$ROOT/apps/vim/vim_dir" ~/.vim
    ln -s -F -f "$ROOT/apps/vim/vimrc" ~/.vimrc
)
# VSCode
(
    mkdir -p ~/Library/Application\ Support/Code/User/
    ln -s -F -f "$ROOT/apps/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json
)
# Itsycal
(
    defaults import -app Itsycal "$ROOT/apps/itsycal/defaults.plist"
)
# FastScripts
(
    defaults import -app FastScripts "$ROOT/apps/fastscripts/defaults.plist"
    # Safari won't always open a new tab next to the current one, but rather at the end of the tab list.
    # This sucks for a tab hoarder like me :/ The script below is a decent workaround.
    # NOTE: the right keyboard shortcut (cmd+T) is already binded in the defaults set above
    mkdir -p ~/Library/Scripts/Applications/Safari
    ln -s -F -f "$ROOT/apps/fastscripts/NewSafariTabNextToCurrent.applescript" \
        ~/Library/Scripts/Applications/Safari/NewSafariTabNextToCurrent.applescript
)

echo "=================================="
echo "Fin: Bye Terminal, hello Ghostty"
echo "=================================="
# Using the full app path here because we've just installed Ghostty and the OS might not have a chance to index it yet
open -a /Applications/Ghostty.app && killall Terminal