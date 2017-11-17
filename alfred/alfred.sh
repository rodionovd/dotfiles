#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

echo "• Installing Alfred preferences"

# Backup an existing .alfredpreferences container if any
ALFRED_DIR="${HOME}/Library/Application Support/Alfred 3/Alfred.alfredpreferences"
if [[ -d "$ALFRED_DIR" ]]; then
    echo "• Backing up the existing Alfred.alfredpreferences"
	mv -v "$ALFRED_DIR" "$ALFRED_DIR"
fi
# Symlink the actual preferences container
ln -s -F -i "$DOTFILES_ROOT/alfred/Alfred.alfredpreferences.symlink" "$ALFRED_DIR"
