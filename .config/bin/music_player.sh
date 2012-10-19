#!/bin/bash

# music_player.sh - launches ncmpcpp connected to my server if it is playing and
# locally otherwise

[[ -z $TERMINAL ]] && export TERMINAL='urxvtc'

# one instance only
pgrep ncmpcpp && exit 0

MY_ESSID=nasafifi
#MY_MUSIC_SERVER='rhoeas'
MY_MUSIC_SERVER='192.168.1.42'
MY_SERVER_PORT=6600

# the 'if server playing' part
if iwconfig | grep $MY_ESSID ; then
	if nc -z $MY_MUSIC_SERVER $MY_SERVER_PORT ; then
		# mpd on that server running
		echo 'connecting to remote mpd'
		$TERMINAL -e ncmpcpp -h $MY_MUSIC_SERVER -p $MY_SERVER_PORT
	fi
else
	pgrep mpd || mpd
	$TERMINAL -e ncmpcpp
fi
