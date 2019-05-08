#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [[ $OSTYPE == "cygwin" ]]; then
  export PATH="$PATH:$HOME/bin/windowswrappers"
fi

export TERM='xterm-256color'

if [[ $OSTYPE == freebsd* ]]; then
  zsh
else
  exec zsh
fi
