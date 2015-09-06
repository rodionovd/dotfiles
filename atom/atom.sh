#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

echo "• Setting Atom up"
ATOMDIR=$HOME/.atom
for file in "config.cson" "init.coffee" "keymap.cson" "snippets.cson" "styles.less"; do
    # Backup first
    if [[ -f "$ATOMDIR/${file}" ]]; then
    	mv -v "$ATOMDIR/${file}" "$ATOMDIR/${file}.bak"
    fi
    # Then symlink configuration files
    ln -s -F -i "$DOTFILES_ROOT/atom/${file}" "$ATOMDIR/${file}"
done

echo "• Installing Atom packages"
for pkg in "autocomplete-python" "spacegray-dark-syntax" "travis-ci-status" "dash" "autosave" "atom-scrolloff"; do
	apm install "${pkg}"
done
# Also install some packages from my GitHub forks
# (I've been tuning them for my own perverted needs).
for fork in "atom-script"; do
    (
        cd ~/.atom/packages
        git clone "https://github.com/rodionovd/${fork}.git"
        cd "${fork}"
        apm install
    )
done
#
apm clean
