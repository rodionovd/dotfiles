#!/usr/bin/env bash

# Install pip if nedded
if [[ ! -f $(which pip) ]];
then
	echo "• Installing pip"
	sudo easy_install pip
fi

echo "• Installing pip packages"
for pkg in "machobot" "nose" "pylint"; do
	sudo -H pip install "${pkg}"
done
