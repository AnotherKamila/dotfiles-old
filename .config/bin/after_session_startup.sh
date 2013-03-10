#!/bin/bash

# ~/.config/bin/after_session_startup.sh

# ctrl+alt+backspace should kill X
setxkbmap -option terminate:ctrl_alt_bksp

# set up input devices and screen(s)
~/.config/bin/peripherals.sh &

# auto-locking and stuff
~/.config/bin/lockscreen.sh &

# for urxvt(c) to load faster
urxvtd &

# kuake-like urxvt window
#~/bin/urxvtq &

# vyhadzovatko
#~/bin/vyhadzovac.sh &

# a neater notification daemon
twmnd &

# automounting daemon
udisksvm &

# cross-WM keybindings
xbindkeys

# dropbox daemon
dropbox start
