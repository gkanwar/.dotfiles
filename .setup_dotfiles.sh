#!/bin/bash
#
# Sets up the .dotfiles repository to appropriately shadow the home directory.
# Run this once to get the initial bare repository in action, then proceed with
# the newly available `config` alias for further changes.

git clone --bare git@github.com:gkanwar/.dotfiles.git ${HOME}/.dotfiles
function config() {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
config checkout
config config --local status.showUntrackedFiles no
if [[ ! -f "${HOME}/.machine" ]]; then
  echo "Creating .machine file"
  read -p "Enter arch [osx/linux]: " arch
  read -p "Enter machine name: " machine
  echo "export ARCH=\"${arch}\"" >> ${HOME}/.machine
  echo "export MACHINE=\"${machine}\"" >> ${HOME}/.machine
fi
