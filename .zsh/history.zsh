HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt hist_find_no_dups

# save history incrementally (as soon as commands are entered), with timestamps
setopt share_history
