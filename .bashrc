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

# git-prompt
if [ -r ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
else
	if [ "$(uname)" == 'Darwin' ]; then
		if [ -r     /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]; then
			/bin/cp /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ~/.git-prompt.sh
		fi
	fi
	if [ -r ~/.git-prompt.sh ]; then
		source ~/.git-prompt.sh
	fi
fi
PS1='\W$(__git_ps1) \$ '

# git-completion
if [ -r ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
else
	if [ "$(uname)" == 'Darwin' ]; then
		if [ -r     /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
			/bin/cp /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ~/.git-completion.bash
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
