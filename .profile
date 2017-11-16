HOME_PROFILE_READED=${HOME_PROFILE_READED}1
export HOME_PROFILE_READED

PATH=$PATH:/usr/local/bin
PATH=$PATH:$HOME/bin

EDITOR=vim
export EDITOR

PYTHONPATH=/usr/local/lib/python2.7/site-packages
export PYTHONPATH

export ANDROID_HOME=/usr/local/opt/android-sdk
export MANPATH="/usr/local/share/man:/usr/share/man"
export BYOBU_PREFIX=`brew --prefix`
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/kagilinn/cocos2d-x/cocos2d-x-3.14.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/kagilinn/cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/kagilinn/cocos2d-x/cocos2d-x-3.14.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/usr/local/Cellar/android-ndk/r13b
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/24.4.1_1
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.10.0/bin
export PATH=$ANT_ROOT:$PATH

export PATH
