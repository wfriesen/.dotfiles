# Override agnoster prompt on cygwin. calls to vcs_info are too slow
if [[ $OSTYPE == "cygwin" ]]; then
  prompt_agnoster_precmd() {
    # vcs_info
    PROMPT='%{%f%b%k%}$(prompt_agnoster_main) '
  }
fi

# Allow agnoster to expand the prompt
setopt promptsubst

export PS1="%n@%m %F{green}%1 %(5~|%-1~/…/%3~|%4~)%F{reset_color}> "
