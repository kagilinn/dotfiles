PS1='\W $ '

alias hd='hexdump -C'
alias ls='ls -FG'
alias mv='mv -i'
alias vim='vim -p'

# git 系 alias
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdft='git difftool'
alias gf='git fetch'
alias glog='git log --oneline --decorate --graph'
alias gmt='git mergetool'
alias gpsup='git push --set-upstream origin `git current-branch`'
alias grh='git reset HEAD'
alias gst='git status'
alias gsta='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'

# screen 用に, プロンプトに動作中のコマンド名を埋め込む.
if [ $TERM == 'screen' ]; then
	PS1='\[\ek\e\\\]'$PS1
fi
