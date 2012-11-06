#!/bin/bash

# ~/.config/bin/after_session_start.sh

~/.config/bin/peripherals.sh &
~/.config/bin/lockscreen.sh &

# a neater notification daemon
twmnd &

# automounting daemon
udisksvm &
