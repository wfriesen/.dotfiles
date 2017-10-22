# If we're not already in tmux, try to connect to an
# unattached tmux session, otherwise start a new one
if [[ -z "$TMUX" ]]; then
  if ! tmux has-session; then
    exec tmux new-session
  else
    UNATTACHED_SESSION=`tmux list-sessions -F '#{session_attached} #{session_name}' | awk '/^0/ {print $2; exit}'`
    if [[ "$UNATTACHED_SESSION" ]]; then
      exec tmux attach-session -t "$UNATTACHED_SESSION"
    else
      exec tmux new-session
    fi
  fi
else
  # If we're in tmux, load all my plugins and settings
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
  source ~/.zsh/agnoster-zsh-theme/agnoster.zsh-theme

  source ~/.zsh/colors.zsh
  source ~/.zsh/completion.zsh
  source ~/.zsh/env.zsh
  source ~/.zsh/aliases.zsh
  source ~/.zsh/prompt.zsh
  source ~/.zsh/bindkeys.zsh
  source ~/.zsh/history.zsh
fi
