# Kamila's dotfiles (http://github.com/anotherkamila/dotfiles)
# .profile -- I keep my environment vars here

source /etc/profile

# env vars {{{

export TERMINAL='urxvtc'

export PATH="$HOME/.gem/ruby/2.0.0/bin:$HOME/.cabal/bin:$HOME/.local/bin:$HOME/bin/:$HOME/.config/bin/:$PATH"

if [ "$DISPLAY" ]; then
	export BROWSER='chrome'
else
	export BROWSER='elinks'
fi
export EDITOR='vim'
export VISUAL="$EDITOR"
#export PAGER='vimpager'
#export MANPAGER='vimmanpager'
export LESS="-RSMgw"

# see
# http://stackoverflow.com/questions/4834353/what-is-up-with-a-z-meaning-a-za-z
# (argh)
export LC_COLLATE='POSIX'

# export GTK_IM_MODULE="xim"  # the input method that doesn't disregard .XCompose

export XDG_CONFIG_HOME="$HOME/.config"

# }}}

# vim: set noet ts=8 sw=8 fdm=marker fdl=99:
