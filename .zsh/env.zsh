export LESS="--quit-if-one-screen"
export LESS="-R $LESS" # Show colors
export LESS="-X $LESS" # Don't clear the screen
export LESS="--LONG-PROMPT $LESS" # Show line numbers currently displayed
export LESS="--ignore-case $LESS"

if [[ $OSTYPE == "cygwin" ]]; then
  export VISUAL="vim.exe"
else
  if ! [[ `command -v vim` ]]; then
    export VISUAL="vi"
  else
    export VISUAL="vim"
  fi
fi

export PATH="$HOME/bin:$PATH"
