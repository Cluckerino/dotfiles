#!/usr/bin/env zsh
#
# add each topic folder to fpath so that they can add functions and completion scripts
#
export DOTFILES_ROOT=$HOME/.dotfiles
for topic_folder ($DOTFILES_ROOT/*)
  if [ -d $topic_folder ];
  then fpath=($topic_folder $fpath);
  fi;
