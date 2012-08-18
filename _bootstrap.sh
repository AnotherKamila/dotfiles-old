#!/bin/bash

EXCLUDE='README.md _*'

for F in * ; do
    SKIP=0
    for pattern in $EXCLUDE ; do [[ $F == $pattern ]] && SKIP=1 ; done
    [[ $SKIP == 1 ]] && continue

#cat << EOF
    rm -rf ~/.$F
    echo "$F"
    ln -s "$(readlink -f $F)" "$(readlink -f ~/.$F)"
#EOF
done
