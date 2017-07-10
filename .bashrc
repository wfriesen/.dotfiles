#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export VISUAL="vim"

export OSTYPE

eval `dircolors ~/.dircolors`

ps | grep -q /usr/bin/XWin || startxwin >/dev/null 2>&1 &
export DISPLAY=:0.0

exec fish
