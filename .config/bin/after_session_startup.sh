#!/bin/bash

# ~/.config/bin/after_session_startup.sh

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
udisksvm -a &

# cross-WM keybindings
xbindkeys &

dropbox start &  # dropbox daemon

conky -c ~/.config/conky/conkyrc &

# bluetooth
blueman-applet &  # load applet...
# sleep 5 && dbus-send --type=method_call --session --print-reply --dest=org.blueman.Applet / org.blueman.Applet.SetBluetoothStatus boolean:false  # ... and turn BT off to save power

# messenger
sleep 5 && psi-plus &
