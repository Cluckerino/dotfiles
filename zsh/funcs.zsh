#!/usr/bin/env zsh
# Custom funcs

# Make a directory then switch to it
mkcd() { mkdir -p "$1" && cd "$1"; } 

# Reload zshrc
alias zshrc='source $HOME/.zshrc'

# Reload zshrc.d
zshrcd() {
  # all of the local zsh files from the ~/.zshrc.d directory.
  if [ -d $HOME/.zshrc.d ]
  then
    local_config_files=($HOME/.zshrc.d/*.zsh)
  else
    local_config_files=""
  fi

  # Load local zshrc stuff appended with "pre-".
  # These need to load before my scripts (especially oh-my-zsh)
  for file in ${(M)local_config_files:#*/pre-*.zsh}
  do
    source $file
  done
}

