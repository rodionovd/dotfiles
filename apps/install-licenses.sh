#!/usr/bin/env bash

set -eo pipefail
ROOT=$(pwd)

if ! op signin; then
    echo "[ERROR] Turn on the 1Password desktop app integration, then run this script again."
    exit 1
fi

# FastScripts
(
    defaults write -app FastScripts "RegistrationUserNameV3" -string "$(op read 'op://Personal/FastScripts/name')"
    defaults write -app FastScripts "RegistrationSerialNumberV3" -string "$(op read 'op://Personal/FastScripts/license key')"
)
# PixelSnap
(
    defaults write -app "PixelSnap 2" "activationKey" -string "$(op read 'op://Personal/PixelSnap 2/license key')"
)
# CodeRunner
(
    defaults write -app "CodeRunner" "RegisteredLicense" -int 1
    defaults write -app "CodeRunner" "LicenseLocked" -int 0
    defaults write -app "CodeRunner" "LicenseKey" -string "$(op read 'op://Personal/CodeRunner/license key')"
)
# Monodraw
(
    defaults write -app "Monodraw" "monodraw.prefs.license.serial-number" -string "$(op read 'op://Personal/Monodraw/license key')" 
)
