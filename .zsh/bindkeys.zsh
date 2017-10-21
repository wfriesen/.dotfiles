bindkey -e
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey \^U backward-kill-line
bindkey '^[[Z' reverse-menu-complete

# Home and End keys
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

if [ -e /usr/share/fzf/key-bindings.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
fi
