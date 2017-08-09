if [ $TERM != "screen-256color" ]; then
  if tmux has-session; then
    exec tmux a
  else
    exec tmux
  fi
fi

autoload -U compinit
compinit

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

eval `dircolors ~/.dircolors`

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%B%F{red}No matches for: %f%d%b'

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

export PS1="%n@%m %F{green}%1 %(5~|%-1~/…/%3~|%4~)%F{reset_color}> "

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt hist_find_no_dups

# save history incrementally (as soon as commands are entered), with timestamps
setopt share_history

bindkey -e
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey \^U backward-kill-line
