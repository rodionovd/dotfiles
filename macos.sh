#!/usr/bin/env bash

# ---- ---- ---- 
# ---- Locale
# ---- ---- ---- 

defaults write -globalDomain AppleLanguages -array en-US ru-RU
defaults write -globalDomain AppleLocale -string "en_RU@currency=rub;rg=ruzzzz" # I have no idea what "zzzz" means here :)
defaults write -globalDomain AppleMeasurementUnits -string "Centimeters"
# Format numbers like "123456.789"
defaults write -globalDomain AppleICUNumberSymbols -dict \
    "0"  -string "." \
    "1"  -string " " \
    "10" -string "." \
    "17" -string " "

# ---- ---- ---- 
# ---- Input: keyboard, mouse, trackpad
# ---- ---- ---- 

# Enable tap to click and three-finger drag (for both built-in and standalone trackpads)
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Enable full keyboard access for all controls
defaults write -globalDomain AppleKeyboardUIMode -int 3

# TODO "Select next source in input menu with ⌘-Space"

# ---- ---- ---- 
# ---- UI: windows, Dock, Finder
# ---- ---- ---- 

# Enable "Ask to keep changes when closing documents"
defaults write -globalDomain NSCloseAlwaysConfirmsChanges -bool false
# Disable "Close windows when quitting an app"
defaults write -globalDomain NSQuitAlwaysKeepsWindows -bool true
# Always prefer tabs to windows when opening documents
defaults write -globalDomain AppleWindowTabbingMode -string "always"
# Minimize toolbar title rollover delay
defaults write -globalDomain NSToolbarTitleViewRolloverDelay -float 0

# Set Dock to appear on the right
defaults write com.apple.dock orientation -string right
# Disable Dock icon magnification
defaults write com.apple.dock magnification -bool false
# Autohide Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.Dock autohide-delay -float 0
# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 16
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Hide Desktop
defaults write com.apple.WindowManager HideDesktop -bool true
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false
# Set ~/Desktop as the default Finder window location
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"
# Show all filename extensions
defaults write -globalDomain AppleShowAllExtensions -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Hide path bar
defaults write com.apple.finder ShowPathbar -bool false
# Show the ~/Library folder
chflags nohidden ~/Library
# Force usage of Finder's list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# ---- ---- ---- 
# ---- Privacy: Siri, Apple Intelligence, other opt-outs
# ---- ---- ---- 

# Disable Siri
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.Siri SiriPrefStashedStatusMenuVisible -bool false
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool false
defaults write com.apple.assistant.support "Assistant Enabled" -bool false
defaults write com.apple.assistant.support "Search Queries Data Sharing Status" -int 2
defaults write com.apple.assistant.support "Siri Data Sharing Opt-In Status" -int 2
# TODO: disable Apple Intelligence?

# ---- ---- ---- 
# ---- Text Editing
# ---- ---- ---- 

# Disable auto-correct and other smart things
defaults write -globalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -globalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write -globalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable the inline language indicator
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled 0
# Use plain text mode for new TextEdit documents
defaults write -app TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write -app TextEdit PlainTextEncoding -int 4
defaults write -app TextEdit PlainTextEncodingForWrite -int 4

# ---- ---- ---- 
# ---- Apps
# ---- ---- ---- 

# Xcode
defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool true
defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 100
defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool true
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers -bool true
defaults write com.apple.dt.Xcode XCFontAndColorCurrentTheme -string "Default (Light).xccolortheme"
defaults write com.apple.dt.Xcode IDECommandClickNavigates -bool true
defaults write com.apple.dt.Xcode XcodeCloudUpsellPromptEnabled -bool false

# Safari
defaults write -app Safari AutoOpenSafeDownloads -bool false
defaults write -app Safari ShowFullURLInSmartSearchField -bool true
defaults write -app Safari ShowOverlayStatusBar -bool true
defaults write -app Safari ShowFavoritesBar -bool false
defaults write -app Safari FindOnPageMatchesWordStartsOnly -bool false
defaults write -app Safari HistoryAgeInDaysLimit -int 365000 # aka "never remove history"
defaults write -app Safari UniversalSearchEnabled -bool false
defaults write -app Safari SuppressSearchSuggestions -bool true
defaults write -app Safari PreloadTopHit -bool false

# Mail
defaults write -app Mail ConversationViewSortDescending -int 1

# Screenshots
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture location -string "~/Desktop/Screenshots"
