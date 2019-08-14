[ -r .bash_aliases ] && source .bash_aliases

alias hd='hexdump -C'
alias irb='irb -I.'

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
