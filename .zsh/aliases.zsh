# Prefix commands with \ to run the non-alias version, e.g. \ls
if [[ $OSTYPE == linux-gnu* || $OSTYPE == "msys" ]]; then
  alias ls='ls --color=auto --group-directories-first --human-readable -1 --literal'
else # BSD
  alias ls='ls -G1' # colored, 1-per-line
fi
alias ll='ls -lah'
alias grep='grep --color=auto'
alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias gg='git grep --color=auto -in'
alias cd-='cd -'
alias pacup='pamac upgrade -a && pamac clean --keep 3'
alias pacin='pamac install'
alias pacrm='pamac remove'
alias mkdir='mkdir -p'
alias type='type -a'
alias du='du -sh'
alias dirs='dirs -v'
alias cp='cp -i'
alias mv='mv -i'
alias pd='popd'
alias gopen='gio open'
alias rscp='rsync --archive --partial --progress'
if [[ $OSTYPE == "msys" ]]; then
  alias ssh='ssh -F ~/.ssh/config'
fi

if [[ $OSTYPE == "msys" ]]; then
  alias vim=$VISUAL
elif [[ $OSTYPE == linux-gnu* || $OSTYPE == freebsd* ]]; then
  alias vi=$VISUAL
fi

dotfiles-update-remotes() {
  pushd $HOME
  for remotename in $(awk '/^\[remote "vim-/ {while ($0 !~ /\s*url\s*=\s*.*/) {getline;} print $0}' .dotfiles/config \
    | sed -e "s/^\s*url = https:\/\/github\.com\/.*\/\(.*\)\.git/\1/g")
  do
    echo Updating $remotename
    eval dotfiles subtree pull --prefix .vim/pack/plugins/start/$remotename vim-$remotename master --squash
  done

  for remotename in $(awk '/^\[remote "zsh-/ {while ($0 !~ /\s*url\s*=\s*.*/) {getline;} print $0}' .dotfiles/config \
    | sed -e "s/^\s*url = https:\/\/github\.com\/.*\/\(.*\)\.git/\1/g")
  do
    echo Updating $remotename
    eval dotfiles subtree pull --prefix .zsh/$remotename zsh-$remotename master --squash
  done

  popd
}
