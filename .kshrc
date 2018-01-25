LOAD_LOG="$LOAD_LOG .kshrc"
export LOAD_LOG

alias ls='ls -FG'
alias mv='mv -i'
alias vim='vim -p'

if [ -n "${SSH_CLIENT}" ]; then
	PS1="${USER}@"`hostname`"$ "
elif [ -n "${SSH_CONNECTION}" ]; then
	PS1="${USER}@"`hostname`"$ "
else
	PS1="ksh$ "
fi
