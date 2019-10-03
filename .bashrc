#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\e[32m\u@\h \e[33m\w\e[0m\n$([[ $? -eq 0 ]] || echo "\e[31m")$\e[0m '

if [[ $OSTYPE == "cygwin" ]]; then
  export PATH="$PATH:$HOME/bin/windowswrappers"
fi

export TERM='xterm-256color'

if [[ $OSTYPE == freebsd* ]]; then
  zsh
else
  exec zsh
fi
