EDITOR=vim
export EDITOR

LANG='ja_JP.UTF-8'
export LANG

PATH=/usr/local/opt/ruby/bin:$PATH

[ -r ~/.profile_local ] && . ~/.profile_local

PATH=$PATH:$HOME/bin
export PATH
