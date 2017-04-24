alias vi "vim"
alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if [ $TERM != "screen" ]
	if tmux has-session
		tmux a
	else
		tmux
	end
end
