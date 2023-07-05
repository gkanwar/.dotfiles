#!/bin/bash
#
# Sets up the .dotfiles repository to appropriately shadow the home directory.
# Run this once to get the initial bare repository in action, then proceed with
# the newly available `config` alias for further changes.

set -e

function config() {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

if [[ ! -d ${HOME}/.dotfiles ]]; then
  tmp=$(mktemp -d -t 'tmp.XXXXXXXX')
  git clone git@github.com:gkanwar/.dotfiles.git \
    --separate-git-dir=${HOME}/.dotfiles --no-checkout \
    ${tmp}
  rm -rf ${tmp}
fi

config checkout
config submodule update --init
config config --local status.showUntrackedFiles no

if [[ ! -f "${HOME}/.machine" ]]; then
  echo "Creating .machine file"
  read -p "Enter arch [osx/linux]: " arch
  read -p "Enter machine name: " machine
  echo "export ARCH=\"${arch}\"" >> ${HOME}/.machine
  echo "export MACHINE=\"${machine}\"" >> ${HOME}/.machine
fi
