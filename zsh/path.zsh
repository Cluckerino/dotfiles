#!/usr/bin/env zsh
#
# Extend the path to .dotfiles and .zshrc.d bins
#

# Unique-ify $path
typeset -U path

export DOTFILES_ROOT=$HOME/.dotfiles
export LOCAL_DOTFILES_ROOT=$HOME/.zshrc.d

# Use zsh $path var to extend the linked $PATH var
path=("$DOTFILES_ROOT/bin" "$LOCAL_DOTFILES_ROOT/bin" $path)