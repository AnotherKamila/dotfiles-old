#!/bin/bash

# ~/.config/bin/after_session_start.sh

exec ~/.config/bin/peripherals.sh
exec ~/.config/bin/lockscreen.sh

# a neater notification daemon
twmnd &

# automounting daemon
udisksvm &
