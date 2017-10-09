# Prefix commands with \ to run the non-alias version, e.g. \ls
alias ls='ls --color=auto --group-directories-first --human-readable -1'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias gg='git grep --color=auto -in'
alias cd-='cd -'
alias pacup='pacaur -Syu'
alias mkdir='mkdir -p'
alias type='type -a'
alias du='du -sh'
alias dirs='dirs -v'
alias cp='cp --interactive'
alias mv='mv --interactive'

dotfiles-update-remotes() {
  pushd $HOME
  for remotename in $(awk '/^\[remote "vim-/ {while ($0 !~ /\s*url\s*=\s*.*/) {getline;} print $0}' .dotfiles/config \
    | sed -e "s/^\s*url = https:\/\/github\.com\/.*\/\(.*\)\.git/\1/g")
  do
    echo Updating $remotename
    eval dotfiles subtree pull --prefix .vim/bundle/$remotename vim-$remotename master --squash
  done
  popd
}

if [[ $OSTYPE == "cygwin" ]]; then
  alias vim=$VISUAL
fi
alias vi=$VISUAL
