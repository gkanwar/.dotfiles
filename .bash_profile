source /etc/profile
source ${HOME}/.bashrc

if [[ "${ARCH}" == "osx" ]]; then
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi
