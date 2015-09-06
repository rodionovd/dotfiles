#!/usr/bin/env bash

echo "• Installing gems"
for gem in "plist" "xcode-install"; do
	sudo -H gem install "${gem}"
done
