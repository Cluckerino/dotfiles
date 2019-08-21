#!/usr/bin/env zsh
#
# Ruby path env
#

RUBY_BREW="/usr/local/opt/ruby"
export PATH="$RUBY_BREW/bin:$PATH"

export DOTFILES_ROOT=$HOME/.dotfiles
source "$DOTFILES_ROOT/ruby/funcs.zsh"

gems2path
