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

alias dit "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

function gg
  git grep --color=auto -in $argv
end

if [ $TERM != screen-256color ]
	if tmux has-session
		tmux a
	else
		tmux
	end
end
