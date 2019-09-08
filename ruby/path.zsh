#!/usr/bin/env zsh
#
# Ruby path env
#

RUBY_BREW="/usr/local/opt/ruby"

# Use zsh $path var to extend the linked $PATH var
path=("$RUBY_BREW/bin" $path)

export DOTFILES_ROOT=$HOME/.dotfiles
source "$DOTFILES_ROOT/ruby/funcs.zsh"

gems2path
