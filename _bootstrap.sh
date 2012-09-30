#!/bin/bash

EXCLUDE="README.md .git/ `basename $0`"

if [[ $(readlink -f $PWD) != $(readlink -f `dirname $0`) ]] ; then
	echo "This script must be run from the dotfiles dir (`dirname $0`)."
	exit 1
fi

REAL_EXCLUDE="${EXCLUDE// /\|}"

for F in $(find . -type f -printf '%P\n' | grep -v -e "^$REAL_EXCLUDE") ; do
	echo -n "$F"
	SF="`readlink -m $F`" ; TF="$HOME/$F"
	rm -f "$TF" ; mkdir -p "`dirname $TF`"
	ln -s "$SF" "$TF"
	echo ' ✔'
done
