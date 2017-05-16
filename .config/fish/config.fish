if [ $TERM != "screen-256color" ]
	if tmux has-session
		tmux a
	else
		tmux
	end
end

if not type vi 1>/dev/null 2>&1; and type vim 1>/dev/null 2>&1
  alias vi "vim"
end

if not type vim 1>/dev/null 2>&1; and type vi 1>/dev/null 2>&1
  alias vim "vi"
end

if which vi 1>/dev/null 2>&1
  set VISUAL vi
else if which vim 1>/dev/null 2>&1
  set VISUAL vim
end

alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

function dotfiles-update-remotes
  pushd $HOME
  for remotename in (grep -A1 "^\[remote \"vim-" .dotfiles/config \
    | grep "url = " \
    | sed -e "s/^\s*url = https:\/\/github\.com\/.*\/\(.*\)\.git/\1/g")
    echo Updating $remotename
    eval dotfiles subtree pull --prefix .vim/bundle/$remotename vim-$remotename master --squash
  end
  popd
end

function gg
  git grep --color=auto -in $argv
end
