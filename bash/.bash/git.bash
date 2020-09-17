alias g='git status'
alias gl='git log'
alias glf='git log --pretty=full'
alias ga='git add -p'
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gh='git show HEAD'
alias gr='cd "$(git rev-parse --show-toplevel)"'

# https://coderwall.com/p/wgq89a/use-tree-with-gitignore
alias gt='tree -a --prune -I .git -I "$(cat .gitignore ~/.gitignore_global 2>/dev/null | egrep -v "^#.*$|^[[:space:]]*$" | tr "\\n" "|").git"'
