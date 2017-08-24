ZDOTDIR=$HOME/.zsh

# Unicode symbol to show at end of partial lines
PROMPT_EOL_MARK=$(echo -n '%F{red}\u23ce')

WORDCHARS=$WORDCHARS:s:/: # Remove /
WORDCHARS="$WORDCHARS|" # Add |
