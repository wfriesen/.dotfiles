HISTFILE=$HOME/.zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_find_no_dups

# Push onto directory stack when doing cd
setopt auto_pushd

# save history incrementally (as soon as commands are entered), with timestamps
setopt share_history
