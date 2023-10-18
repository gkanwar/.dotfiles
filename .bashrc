# Machine-specific definitions. Sets at least ARCH.
if [[ -e "${HOME}/.machine" ]]; then
  source ${HOME}/.machine
fi


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

### History
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend
PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"
if [[ "${ARCH}" == "osx" ]]; then
  SHELL_SESSION_HISTORY=1
fi


### Window
shopt -s checkwinsize


### Colors
# color prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
  PS1='\h:\W\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
else
  export CLICOLOR=1
  export LSCOLORS=Exfxcxdxbxegedabagacad
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


### Misc
# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Disable terminal locking
stty -ixon


### Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


### General paths
# XDG
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state
mkdir -p ${XDG_CONFIG_HOME}
mkdir -p ${XDG_DATA_HOME}
mkdir -p ${XDG_STATE_HOME}
# Make other stuff respect XDG dirs
export SCREENRC=${HOME}/.config/screen/screenrc
# Home prefix
export PATH=${PATH}:${HOME}/.local/bin
export CPATH=${CPATH}:${HOME}/.local/include
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${HOME}/.local/include
export LIBRARY_PATH=${LIBRARY_PATH}:${HOME}/.local/lib


### Software
# Android
if [[ "${ARCH}" == "linux" ]]; then
  export ANDROID_HOME=${HOME}/Android/Sdk
  export ANDROID_NDK_HOME=${HOME}/android-ndk-r10e
elif [[ "${ARCH}" == "osx" ]]; then
  export CPATH="${CPATH}:/Applications/Android Studio.app/Contents/jre//jdk/Contents/Home/include/:/Applications/Android Studio.app/Contents/jre//jdk/Contents/Home/include/darwin/"
fi

# IDKJava
export IDKJAVA_KEYSTORE=${HOME}/Dropbox/idkjava/keystore/keystore_idkjava
export IDKJAVA_KEYALIAS=idkjava
export LD_LIBRARY_PATH=${HOME}/the-elements/TheElements-linux/bin:${LD_LIBRARY_PATH}

# lattlib
export PATH=${PATH}:${HOME}/lattlib/bin:${HOME}/lattlib/pybin
export PYTHONPATH=${PYTHONPATH}:${HOME}/lattlib/pylib
export PYTHONPATH=${PYTHONPATH}:${HOME}/lattlib

# lqft-flow
export PYTHONPATH=${PYTHONPATH}:${HOME}/LQFTflow
export PYTHONPATH=${PYTHONPATH}:${HOME}/lqft-flow-2

# Set up environment modules
if [[ -e "/usr/share/modules/init/bash" ]]; then
  source "/usr/share/modules/init/bash"
fi

# Manual conda init stuff so this works across machines
if [ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
  . "${HOME}/miniconda3/etc/profile.d/conda.sh"
elif [ -f "${HOME}/anaconda/etc/profile.d/conda.sh" ]; then
  . "${HOME}/anaconda/etc/profile.d/conda.sh"
elif [ -f "${HOME}/anaconda3/etc/profile.d/conda.sh" ]; then
  . "${HOME}/anaconda3/etc/profile.d/conda.sh"
elif [ -f "/optext/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/optext/anaconda3/etc/profile.d/conda.sh"
elif [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/opt/anaconda3/etc/profile.d/conda.sh"
elif [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/opt/miniconda3/etc/profile.d/conda.sh"
fi

# Homebrew
PATH=${PATH}:/opt/homebrew/bin

# Haskell
if [[ -f ${HOME}/.ghcup/env ]]; then
    source ${HOME}/.ghcup/env
fi

# Rust
if [[ -f ${HOME}/.cargo/env ]]; then
    source ${HOME}/.cargo/env
fi
export PATH=${HOME}/.cargo/bin:${PATH}

# Rust "pixels" library
export PIXELS_HIGH_PERF=1

# OCaml
if [[ -r ${HOME}/.opam/opam-init/init.sh ]]; then
  source ${HOME}/.opam/opam-init/init.sh
fi
