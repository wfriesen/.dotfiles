#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [[ $OSTYPE == "cygwin" ]]; then
  export VISUAL="vim.exe"
  export PATH="$PATH:$HOME/bin/windowswrappers"
else
  export VISUAL="vim"
fi

export OSTYPE

eval `dircolors ~/.dircolors`
exec fish
