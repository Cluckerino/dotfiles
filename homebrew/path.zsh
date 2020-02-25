#!/usr/bin/env zsh
#
# Extend the path to the linuxbrew directories
#

if test "$(uname)" != "Darwin" && test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
  # Unique-ify $path
  typeset -U path

  # Use zsh $path var to extend the linked $PATH var
  path=("/home/linuxbrew/.linuxbrew/bin" "$HOME/.linuxbrew/bin" $path)
fi
