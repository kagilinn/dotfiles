[ -r ~/.bash_aliases ] && source ~/.bash_aliases

alias hd='hexdump -C'
alias irb='irb -I.'

# git-prompt
export GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_DESCRIBE_STYLE='branch'
export GIT_PS1_SHOWCOLORHINTS=true
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
PS1=''
AUTO_LS_AFTER_CD_DIR="${PWD}"
prompt_command_function () {
	# 現時点での終了コードを保存.
	local status=$(echo ${PIPESTATUS[@]})

	# ヘッダ部分.
	local header='[*]unstaged [+]uncommited [$]stashed [%]untracked
'
	# 終了コード.
	local status_header=''
	for s in $status; do
		if [ $s -ne 0 ]; then
			status_header="\[\e[31m\](${status// /|})\[\e[0m\]"
			break
		fi
	done

	# 初回判定.
	[[ $AUTO_LS_AFTER_CD_DIR != $PWD ]] && ls
	AUTO_LS_AFTER_CD_DIR="${PWD}"

	if [[ -n "${SSH_CONNECTION}" || -n "${SSH_CLIENT}" ]]; then
		# SSH 接続の場合, ユーザ名やホスト名も表示.

		# CentOS 風?
#		__git_ps1 $header'[\u@\h]\W' '\$ '

		# macOS 風.
		local body='\h:\W \u'
	else
		# SSH 接続でない場合, カレントディレクトリの表示のみ.
		local body='\W'
	fi

	# screen 用に, プロンプトに動作中のコマンド名を埋め込む.
	if [ $TERM == 'screen' ]; then
		local screen='\[\ek\e\\\]'
	fi
	__git_ps1 "$screen$header$status_header$body" '\$ '
}
PROMPT_COMMAND='prompt_command_function'

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

[ -r ~/.bashrc_local ] && source ~/.bashrc_local
