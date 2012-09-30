# Kamila's dotfiles (http://github.com/anotherkamila/dotfiles)
# .profile -- I keep my environment vars here

source /etc/profile

# env vars {{{

export TERMINAL='urxvtc'

export PATH="~/bin/:~/.config/bin/:$PATH"

if [[ -n "$DISPLAY" ]]; then
    export EDITOR='subl -n'
	export BROWSER='chromium'
    export GIT_EDITOR='vim'  # faster to load than ST
else
    export EDITOR='vim'
	export BROWSER='elinks'
fi
export VISUAL=$EDITOR
export PAGER='vimpager'
#export MANPAGER='vimmanpager'

# see
# http://stackoverflow.com/questions/4834353/what-is-up-with-a-z-meaning-a-za-z
# (argh)
export LC_COLLATE='POSIX'

# }}}

# vim: set noet ts=8 sw=8 fdm=marker fdl=99:
