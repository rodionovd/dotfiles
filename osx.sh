#!/usr/bin/env bash

# Havily based on mathiasbynens's ~/.osx: https://mths.be/osx

echo "• Updating OS X defaults"

# --[ Systemwide ]--

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable «smart» quotes and «smart» dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable "Ask to keep changes when closing documents"
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool false

# Disable "close windows when quitting an app"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true

# Enable Graphite appearance
defaults write NSGlobalDomain AppleAquaColorVariant -int 6

# Use dark menubar and Dock
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Click in the scroll bar: Jump to the spot that's clicked
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1

# Always prefer tabs to windows when opening documents
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"

# Reduce Transparency
defaults write com.apple.universalaccess reduceTransparency -bool true

# Disable Sound Effects on Boot
sudo nvram SystemAudioVolume=" "

# Enable Application layer firewall, logging and "stealth mode"
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false
sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool true
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

# Don't open any apps when attaching a "camera"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# --[ Locale ]--

# I use Russian units in English with USD for currency
defaults write NSGlobalDomain AppleLocale -string "en_RU@currency=USD"

defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"

defaults write NSGlobalDomain AppleMetricUnits -int 1

defaults write NSGlobalDomain Country -string "US"

# Use English and Russian languagues, in this particular order
defaults write NSGlobalDomain AppleLanguages -array en-US ru-RU


# --[ Trackpad ]--

# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable three finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# --[ Finder ]--

# Set $HOME as the default Finder window location
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Documents/"

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Don't show much on my desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Hide path bar
defaults write com.apple.finder ShowPathbar -bool false

# Allow text selection in Quick Look
# FIXME(rodionovd): doesn't work on 10.11 El Capitan (rdar://23062430)
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Tune the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0.1f

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Force usage of Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"

# Desktop icons size
PLISTBUDDY=/usr/libexec/plistbuddy
FILE=~/Library/Preferences/com.apple.finder.plist
$PLISTBUDDY -c "Set :DesktopViewSettings:IconViewSettings:iconSize 36" $FILE
# Desktop labels size
$PLISTBUDDY -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" $FILE
# Always show icon previews
$PLISTBUDDY -c "Set :DesktopViewSettings:IconViewSettings:showIconPreview true" $FILE

# --[ Dock ]--

# Set Dock to appear on the left
defaults write com.apple.dock orientation -string right

# Disable Dock icon magnification
defaults write com.apple.dock magnification -bool false

# Autohide Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.Dock autohide-delay -float 0

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 16

# --[ Safary ]--

# Disable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false

# Disable plug-ins
defaults write com.apple.Safari WebKitPluginsEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Enable the Develop menu and the Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Do not preload Top Hits in the background
defaults write com.apple.Safari PreloadTopHit -bool false

# Show status bar
defaults write com.apple.Safari ShowOverlayStatusBar -bool true

# --[ Activity Monitor ]--

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# --[ TextEdit ]--

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# --[ Messages ]--

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# --[ Time Machine ]---

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
sudo tmutil disablelocal

# --[ Xcode ]--

# Trim trailing whitespace
defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool true

# Trim whitespace only lines
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true

# Show line numbers
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers -bool true

# Show ruler at 100 chars
defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool true
defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 100

# Disable source control
defaults write com.apple.dt.Xcode IDESourceControlEnableSourceControl_7_1 -bool false

# Show build times in toolbar
# http://cocoa.tumblr.com/post/131023038113/build-speed
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true

# Use Sunset color theme
defaults write com.apple.dt.Xcode DVTFontAndColorCurrentTheme -string "Sunset.dvtcolortheme"

# Power!
defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks -int `sysctl -n hw.ncpu`

# -- [ Mail ]--

# Don't load remote content
defaults write com.apple.mail-shared DisableURLLoading -bool true

# -- [ Transmission ]--

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# IP block list.
# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

# --[ Network ]--

# Use OpenDNS servers
sudo networksetup -setdnsservers Wi-Fi 208.67.220.220 208.67.222.222

# -- [Keyboard and Trackpad ]--

# Select next source in input menu with ⌘Space
PLISTBUDDY=/usr/libexec/plistbuddy
FILE=~/Library/Preferences/com.apple.symbolichotkeys.plist
# Reset existing entry (if any)
$PLISTBUDDY -c "delete :AppleSymbolicHotKeys:60" $FILE
$PLISTBUDDY -c "add :AppleSymbolicHotKeys:60 dict" $FILE
$PLISTBUDDY -c "add :AppleSymbolicHotKeys:60:enabled bool YES" $FILE
$PLISTBUDDY -c "add :AppleSymbolicHotKeys:60:value dict" $FILE
$PLISTBUDDY -c "add :AppleSymbolicHotKeys:60:value:parameters array" $FILE
	$PLISTBUDDY -c "add :AppleSymbolicHotKeys:60:value:parameters:0 integer 32" $FILE
	$PLISTBUDDY -c "add :AppleSymbolicHotKeys:60:value:parameters:1 integer 49" $FILE
	$PLISTBUDDY -c "add :AppleSymbolicHotKeys:60:value:parameters:2 integer 1048576" $FILE
$PLISTBUDDY -c "add :AppleSymbolicHotKeys:60:value:type string standard" $FILE

# Enable three-finger drag on Trackpad
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# TODO: install custom keyboard layout (Ilya Birman Typography Layout)
open http://ilyabirman.ru/projects/typography-layout/

# --[ Menubar ]--

# Always display Volume menubar item
FILE=~/Library/Preferences/com.apple.systemuiserver.plist
$PLISTBUDDY -c "add :menuExtras:0 string '/System/Library/CoreServices/Menu Extras/Volume.menu'" $FILE

# -- [ Login Items ]--

function add_login_item {
	osascript -e "tell application \"System Events\" to make login item at end with properties {path: \"$1\", hidden:true}"
}

add_login_item "/Applications/iTerm.app"
add_login_item "/Applications/Safari.app"
add_login_item "/Applications/Mail.app"
add_login_item "/Applications/Slack.app"
add_login_item "/Applications/GitHub.app"
add_login_item "/Applications/Notes.app"

# TODO: notifications (Notifications.prefPane && /usr/sbin/usernoted)
# TODO: notification center widgets (com.apple.notificationcenterui.plist)

# ============================================================
# Apply the changes
#

# Force re-syncing of new preferences
killall cfprefsd

for app in "Activity Monitor" "Finder" "Messages" "Safari" "SystemUIServer" "Xcode"; do
	killall "${app}" > /dev/null 2>&1
done

for app in "Safari"; do
	open -a "${app}"
done

# ============================================================
# Software Updates
#

echo "• Install all available software updates"
if softwareupdate -l 2>&1 | grep $Q "No new software available."; then
	echo "Your system is up to date 🌟"
else
	sudo softwareupdate --install --all
fi

# ============================================================
# Full-disk encryption
# Courtesy of MikeMcQuaid: https://github.com/MikeMcQuaid/strap

if fdesetup status | grep $Q -E "FileVault is (On|Off, but will be enabled after the next restart)."; then
	echo "• Full-disk encryption is already enabled or will be enabled after the next restart"
else
	echo "• Enabling full-disk encryption (FileVault)"
	sudo fdesetup enable -user "$USER" | tee ~/Desktop/"FileVault_Recovery_Key.txt"
	echo "⚠️ Full-disk encryption will be enabled after the next restart"
fi
