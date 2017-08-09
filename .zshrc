if [ $TERM != "screen-256color" ]; then
  if tmux has-session; then
    exec tmux a
  else
    exec tmux
  fi
fi

autoload -U compinit
compinit

eval `dircolors ~/.dircolors`

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if [[ $OSTYPE == "cygwin" ]]; then
  export VISUAL="vim.exe"
  export PATH="$PATH:$HOME/bin/windowswrappers"
  alias vim=$VISUAL
else
  export VISUAL="vim"
fi
alias vi=$VISUAL
