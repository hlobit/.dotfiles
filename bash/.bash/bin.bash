if [[ ! "$PATH" == *$HOME/.bin* ]]; then
  export PATH="$PATH:$HOME/.bin"
  [ -d ~/.bin/completion.d ] && for f in ~/.bin/completion.d/*
    do source "$f"
  done
fi

# node without sudo
if [[ ! "$PATH" == *$HOME/.local/bin* ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi
