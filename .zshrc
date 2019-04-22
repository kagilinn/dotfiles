bindkey -e
setopt always_last_prompt
setopt autocd
setopt correct
setopt markdirs
setopt nobeep
setopt prompt_subst
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
alias cp='cp -i'
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
alias gpsup='git push --set-upstream origin $(git symbolic-ref --short HEAD)'
alias grh='git reset HEAD'
alias gst='git status'
alias gsta='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gu='git merge origin/$(git symbolic-ref --short HEAD)'
alias la='ls -aG'
alias ll='ls -lG'
alias lla='ls -alG'
alias ls='ls -G'
alias mv='mv -i'
alias rm='rm -i'
alias tac='sed "1!G; \$!h; \$!d"'
alias vim='vim -p'
export GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_DESCRIBE_STYLE='branch'
[ -r ~/.git-prompt.sh ] && source ~/.git-prompt.sh
export PS1='[*]unstaged [+]uncommited [$]stashed [%%]untracked
%(?,,%F{9}x%?%f )%.%F{9}$(__git_ps1)%f $ '
function chpwd() { ls }
