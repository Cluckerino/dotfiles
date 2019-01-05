#!/bin/sh
#
# Links dynamic profiles for iterm2
#
set -e

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

ln $DOTFILES_ROOT/iterm2/default_profile.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/linked_settings.json
