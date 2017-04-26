if [ $TERM != "screen-256color" ]
  if tmux has-session
    exec tmux a
  else
    exec tmux
  end
end

alias vi $VISUAL
if [ $OSTYPE = "cygwin" ]
  alias vim $VISUAL
end

alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if [ (uname -o) = 'Cygwin' ];
and not type diffmerge 1>/dev/null 2>&1;
and which sgdm 1>/dev/null 2>&1;
and [ ! -f /usr/local/bin/diffmerge ]
  ln -s $HOME/scripts/diffmerge-wrapper.sh /usr/local/bin/diffmerge
end

function dotfiles-update-remotes
  pushd $HOME
  for remotename in (awk '/^\[remote "vim-/ {while ($0 !~ /\s*url\s*=\s*.*/) {getline;} print $0}' .dotfiles/config \
    | sed -e "s/^\s*url = https:\/\/github\.com\/.*\/\(.*\)\.git/\1/g")
    echo Updating $remotename
    eval dotfiles subtree pull --prefix .vim/bundle/$remotename vim-$remotename master --squash
  end
  popd
end

function gg
  git grep --color=auto -in $argv
end
