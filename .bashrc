#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\e[32m\u@\h \e[33m\w\e[0m\n$([[ $? -eq 0 ]] || echo "\e[31m")$\e[0m '

if [[ $OSTYPE == "cygwin" ]]; then
  export PATH="$PATH:$HOME/bin/windowswrappers"
fi

export TERM='xterm-256color'

if command -v zsh >/dev/null 2>&1; then
  if [[ $OSTYPE == freebsd* ]]; then
    zsh
  else
    exec zsh
  fi
else
  source ~/.zsh/aliases.zsh
  source ~/.zsh/env.zsh
  source ~/.zsh/colors.zsh
fi
