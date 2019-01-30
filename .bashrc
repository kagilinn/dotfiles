alias hd='hexdump -C'
alias ls='ls -FG'
alias ll='ls -lFG'
alias la='ls -aFG'
alias lla='ls -alFG'
alias mv='mv -i'
alias cp='cp -i'
alias vim='vim -p'
alias view='view -p'

# 対話からの grep はバイナリ無視, 色付き.
alias grep='grep -I --color'
alias fgrep='fgrep -I --color'
alias egrep='egrep -I --color'

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
alias gu='git merge origin/`git symbolic-ref --short @`'

# ssh-prompt
PS1="${SSH_CONNECTION}"
if [[ -n "${SSH_CONNECTION}" || -n "${SSH_CLIENT}" ]]; then
	PS1='[\u@\h]'
else
	PS1=''
fi

# git-prompt
if [ -r ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
else
	if [ "$(uname)" == 'Darwin' ]; then
		if [ -r     /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]; then
			cp /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ~/.git-prompt.sh
		fi
	fi
	if [ -r ~/.git-prompt.sh ]; then
		source ~/.git-prompt.sh
	fi
fi
PS1=$PS1'\W$(__git_ps1) \$ '

# git-completion
if [ -r ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
else
	if [ "$(uname)" == 'Darwin' ]; then
		if [ -r     /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
			cp /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ~/.git-completion.bash
		fi
	fi
	if [ -r ~/.git-completion.bash ]; then
		echo '#'                                >> ~/.git-completion.bash
		echo '# for user-defined alias'         >> ~/.git-completion.bash
		echo '#'                                >> ~/.git-completion.bash
		echo '__git_complete gco _git_checkout' >> ~/.git-completion.bash
		source ~/.git-completion.bash
	fi
fi

# screen 用に, プロンプトに動作中のコマンド名を埋め込む.
if [ $TERM == 'screen' ]; then
	PS1='\[\ek\e\\\]'$PS1
fi

[ -r ~/.bashrc_local ] && source ~/.bashrc_local
