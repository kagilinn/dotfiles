#!/bin/ksh
. ~/.profile
FISH_PATH_TMP=$PATH /usr/local/bin/fish \
    --init-command='set PATH $FISH_PATH_TMP' "$@"
