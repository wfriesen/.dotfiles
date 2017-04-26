if not type vi 1>/dev/null 2>&1; and type vim 1>/dev/null 2>&1
  alias vi "vim"
end

if not type vim 1>/dev/null 2>&1; and type vi 1>/dev/null 2>&1
  alias vim "vi"
end
alias dit "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if [ $TERM != "screen" ]
	if tmux has-session
		tmux a
	else
		tmux
	end
end
