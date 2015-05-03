#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

echo "• Installing iTerm2 Preferences"
# Kill iTerm (if it's not the current terminal) to avoid syncing problems
if [[ "iTerm.app" != "$TERM_PROGRAM" ]]; then
        killall iTerm
fi
# Kill the prefs deamon to avoid re-syncing of old preferences
killall cfprefsd
# Symlink com.googlecode.iterm2.plist
ln -s -F -i "$DOTFILES_ROOT/iterm2/com.googlecode.iterm2.plist" \
            "$HOME/Library/Preferences/com.googlecode.iterm2.plist"
# Kill it again to force re-syncing of new preferences
killall cfprefsd
# Re-open iTerm.app
open -a iTerm
