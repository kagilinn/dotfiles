bindkey -e
bindkey '[3~' delete-char

setopt always_last_prompt
setopt autocd
setopt correct
setopt markdirs
setopt nobeep
setopt prompt_subst

alias cp='cp -i'
alias egrep='egrep -I --color'
alias fgrep='fgrep -I --color'
alias grep='grep -I --color'
alias ls='ls $LS_COLOR_OPTION_FLAG'
alias la='ls -a $LS_COLOR_OPTION_FLAG'
alias ll='ls -l $LS_COLOR_OPTION_FLAG'
alias lla='ls -al $LS_COLOR_OPTION_FLAG'
alias mv='mv -i'
alias rm='rm -i'
alias tac='sed "1!G; \$!h; \$!d"'
alias view='view -p'
alias vim='vim -p'

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
alias gpsup='git push --set-upstream origin $(git symbolic-ref --short HEAD)'
alias grh='git reset HEAD'
alias gst='git status'
alias gsta='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gu='git merge origin/$(git symbolic-ref --short HEAD)'
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
export GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_DESCRIBE_STYLE='branch'
export GIT_PS1_SHOWCOLORHINTS=true
[ -r ~/.git-prompt.sh ] && source ~/.git-prompt.sh
precmd() {
	__git_ps1 '[*]unstaged [+]uncommited [$]stashed [%%]untracked
%(?,,%F{9}x%?%f )%.' ' $ '
}
function chpwd() { ls }
