#
# Sets reasonable macOS defaults.
#

# DAMMIT FINDER SHOW MY FILES
defaults write com.apple.finder AppleShowAllFiles YES

# Disable press-and-hold for keys in favor of key repeat.
#defaults write -g ApplePressAndHoldEnabled -bool false

## Adjust dock size and behavior
# Small icons
defaults write com.apple.dock tilesize -float 40
# Magnify to big icons
defaults write com.apple.dock magnification -boolean YES
defaults write com.apple.dock largesize -float 90

killall Dock