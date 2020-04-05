EDITOR=vim
export EDITOR

LANG='ja_JP.UTF-8'
export LANG

BYOBU_PREFIX=/usr/local
export BYOBU_PREFIX

HUDSON_HOME=$HOME/.jenkins
export HUDSON_HOME

# Ruby (RubyGems)
for p in `ls -1d /usr/local/lib/ruby/gems/*/bin`
do
	PATH=$p:$PATH
done
PATH=/usr/local/opt/ruby/bin:$PATH

# Imagemagick
PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig
export PKG_CONFIG_PATH

DISPLAY=:0.0
export DISPLAY



PATH=$PATH:/usr/local/sbin

# libxml2
PATH=$PATH:/usr/local/opt/libxml2/bin

# PHP
PATH=$PATH:$HOME/.composer/vendor/bin

# Haskell
PATH=$PATH:$HOME/.local/bin

# Rust
PATH=$PATH:$HOME/.cargo/bin
RUST_BIN=/usr/local/opt/rust/bin

# Groovy
GROOVY_HOME=/usr/local/opt/groovy/libexec
export GROOVY_HOME

# Go
PATH=$PATH:/usr/local/opt/go/libexec/bin

[ -r ~/.profile_local ] && . ~/.profile_local

PATH=$PATH:$HOME/bin
export PATH
