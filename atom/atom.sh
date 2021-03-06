#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

echo "• Setting Atom up"
ATOMDIR=$HOME/.atom
mkdir $ATOMDIR
for file in "config.cson" "init.coffee" "keymap.cson" "snippets.cson" "styles.less"; do
    # Backup first
    if [[ -f "$ATOMDIR/${file}" ]]; then
    	mv -v "$ATOMDIR/${file}" "$ATOMDIR/${file}.bak"
    fi
    # Then symlink configuration files
    ln -s -F -i "$DOTFILES_ROOT/atom/${file}" "$ATOMDIR/${file}"
done

echo "• Installing Atom packages"
for pkg in "autocomplete-python" "spacegray-dark-syntax" "travis-ci-status" "dash" "language-lua" "language-applescript" "language-scheme"; do
	apm install "${pkg}"
done
#
apm clean
