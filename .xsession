#!/bin/bash

# ~/.xsession - sourced by .xinitrc

# ctrl+alt+backspace kills X
setxkbmap -option terminate:ctrl_alt_bksp

# restore background
eval $(cat ~/.fehbg)

urxvtd &
# kuake-like urxvt window
#~/bin/urxvtq &

# vyhadzovatko
#~/bin/vyhadzovac.sh &
