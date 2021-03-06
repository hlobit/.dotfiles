export EDITOR='nvim'
export VISUAL="$EDITOR"

bind 'set enable-bracketed-paste on'
bind 'set revert-all-at-newline on'

# eternal bash history
export HISTSIZE=
export HISTFILESIZE=
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

# NOTE: maybe we should just log instead of using unified bash history
# this way we would not merge contexts across terminals while keeping access to the entire history
#
# https://superuser.com/a/734410
# unified bash history
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
