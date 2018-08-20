# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hlo/.fzf/bin* ]]; then
  export PATH="$PATH:/home/hlo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hlo/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/hlo/.fzf/shell/key-bindings.bash"

# Default command
# ------------
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --color=always'
export FZF_DEFAULT_OPTS='--ansi'
