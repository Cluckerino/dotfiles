#!/usr/bin/env zsh
#
# Setup node environment here
#

# Use zsh linking to wrangle paths
export -T NODE_PATH node_path
typeset -U node_path
node_path=("$(npm root -g)" $node_path)