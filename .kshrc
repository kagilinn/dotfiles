set -o emacs

LOAD_LOG="$LOAD_LOG .kshrc"
export LOAD_LOG

alias irb='irb -I.'
alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -lFG'
alias lla='ls -alFG'
alias mv='mv -i'
alias cp='cp -i'
alias vim='vim -p'
alias view='view -p'
alias ga='git add'
alias gc='git commit --verbose'
alias gd='git diff'
alias gdca='git diff --cached'
alias gf='git fetch'
alias gst='git status'
alias gsta='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'

if [ -n "${SSH_CLIENT}" ]; then
	PS1="[${USER}@`hostname` \${PWD##*/}]$ "
elif [ -n "${SSH_CONNECTION}" ]; then
	PS1="[${USER}@`hostname` \${PWD##*/}]$ "
else
	PS1="\${PWD##*/}$ "
fi
