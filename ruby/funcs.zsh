#!/usr/bin/env zsh
#
# Ruby funcs
#

gemuserdir() {
  if which ruby >/dev/null && which gem >/dev/null; then
    ruby -r rubygems -e 'puts Gem.user_dir'
  fi
}

gemdir() {
  if which ruby >/dev/null && which gem >/dev/null; then
    ruby -r rubygems -e 'puts Gem.dir'
  fi
}

# See: https://guides.rubygems.org/faqs/ about commands not being available
gems2path() {
  if which ruby >/dev/null && which gem >/dev/null; then
    # Use zsh $path var to extend the linked $PATH var
    path=("$(gemuserdir)/bin" "$(gemdir)/bin" $path)
  fi
}
