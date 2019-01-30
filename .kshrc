set -o emacs

LOAD_LOG="$LOAD_LOG .kshrc"
export LOAD_LOG

alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -lFG'
alias lla='ls -alFG'
alias mv='mv -i'
alias vim='vim -p'
alias ga='git add'
alias gd='git diff'
alias gdca='git diff --cached'
alias gst='git status'
alias gsta='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'

if [ -n "${SSH_CLIENT}" ]; then
	PS1="${USER}@"`hostname`"$ "
elif [ -n "${SSH_CONNECTION}" ]; then
	PS1="${USER}@"`hostname`"$ "
else
	PS1="ksh$ "
fi
