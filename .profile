# Kamila's dotfiles (http://github.com/anotherkamila/dotfiles)
# .profile -- I keep my environment vars here

source /etc/profile

# env vars {{{

export TERMINAL='urxvtc'

export PATH="~/.gem/ruby/2.1.0/bin:~/bin/:~/.config/bin/:$PATH"

if [[ -n "$DISPLAY" ]]; then
    export EDITOR='subl3 -n'
	export BROWSER='chromium'
    export GIT_EDITOR='vim'  # faster to load than ST
else
    export EDITOR='vim'
	export BROWSER='elinks'
fi
export VISUAL=$EDITOR
# export PAGER='vimpager'
export LESS="-RSMgw"
#export MANPAGER='vimmanpager'

# see
# http://stackoverflow.com/questions/4834353/what-is-up-with-a-z-meaning-a-za-z
# (argh)
export LC_COLLATE='POSIX'

# export GTK_IM_MODULE="xim"  # the input method that doesn't disregard .XCompose

export XDG_CONFIG_HOME="$HOME/.config"

# }}}

# vim: set noet ts=8 sw=8 fdm=marker fdl=99:
