if [ $TERM != "screen-256color" ]
  if tmux has-session
    exec tmux a
  else
    exec tmux
  end
end

if not type vi 1>/dev/null 2>&1; and type vim 1>/dev/null 2>&1
  alias vi "vim"
end

if not type vim 1>/dev/null 2>&1; and type vi 1>/dev/null 2>&1
  alias vim "vi"
end

alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

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
