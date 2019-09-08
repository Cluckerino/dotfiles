#!/usr/bin/env zsh
#
# Setup Go environment here
#

# Use zsh linking to wrangle paths
export -T GOPATH gopath
typeset -U gopath
gopath=("$HOME/go" $gopath)

# Use zsh $path var to extend the linked $PATH var
path=("$GOPATH/bin" $path)