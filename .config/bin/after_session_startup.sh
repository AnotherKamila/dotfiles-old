#!/bin/bash

# ~/.config/bin/after_session_startup.sh

~/.config/bin/peripherals.sh &
~/.config/bin/lockscreen.sh &

# a neater notification daemon
twmnd &

# automounting daemon
udisksvm &
