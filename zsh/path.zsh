#!/usr/bin/env zsh
#
# Extend the path to .dotfiles and .zshrc.d bins
#

export DOTFILES_ROOT=$HOME/.dotfiles
export LOCAL_DOTFILES_ROOT=$HOME/.zshrc.d
export PATH="$DOTFILES_ROOT/bin:$LOCAL_DOTFILES_ROOT/bin:$PATH"