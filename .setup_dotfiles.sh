#!/bin/bash
#
# Sets up the .dotfiles repository to appropriately shadow the home directory.
# Run this once to get the initial bare repository in action, then proceed with
# the newly available `config` alias for further changes.

git clone --bare git@github.com:gkanwar/.dotfiles.git ${HOME}/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no

