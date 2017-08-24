alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias gg='git grep --color=auto -in'
alias cd-='cd -'
alias pacup='pacaur -Syu'

if [[ $OSTYPE == "cygwin" ]]; then
  alias vim=$VISUAL
fi
alias vi=$VISUAL
