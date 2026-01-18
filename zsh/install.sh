#!/usr/bin/env bash
#
# Installs things needed for zsh
#

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install the Homebrew installed p10k as an Oh My Zsh custom theme.
#
# This is hacky, but since these are not omz supported plugins, I can't update them via the omz CLI.
# I am unlikely to go into the custom dir and do a git pull, so I'd much rather manage it via Homebrew.
echo "Symlinking the brew theme into oh-my-zsh"

# Install Powerlevel10k
ln -s $(brew --prefix)/share/powerlevel10k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Listing the Oh My Zsh custom theme directory"
ls -la ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes

