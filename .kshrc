set -o emacs

LOAD_LOG="$LOAD_LOG .kshrc"
export LOAD_LOG

alias irb='irb -I.'
alias ls='ls $LS_COLOR_OPTION_FLAG'
alias la='ls -a $LS_COLOR_OPTION_FLAG'
alias ll='ls -l $LS_COLOR_OPTION_FLAG'
alias lla='ls -al $LS_COLOR_OPTION_FLAG'
alias mv='mv -i'
alias cp='cp -i'
alias ghc='stack ghc --'
alias vim='vim -p'
alias view='view -p'

# RCS の分かりやすさ優先コマンド.
alias rcscheckout='co -l'
alias rcscommit='ci -l'
alias rcsinit='mkdir -v RCS'

alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdft='git difftool'
alias gf='git fetch'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gmt='git mergetool'
alias gpsup='git push --set-upstream origin `git symbolic-ref --short HEAD`'
alias grh='git reset HEAD'
alias gst='git status'
alias gsta='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gu='git merge origin/`git symbolic-ref --short HEAD`'

if [ -n "${SSH_CLIENT}" ]; then
	PS1="[${USER}@`hostname` \${PWD##*/}]$ "
elif [ -n "${SSH_CONNECTION}" ]; then
	PS1="[${USER}@`hostname` \${PWD##*/}]$ "
else
	PS1="\${PWD##*/}$ "
fi
