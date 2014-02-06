# Kamila's dotfiles (http://github.com/anotherkamila/dotfiles)
# .bashrc -- sourced by the bash shell

# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
[[ $- != *i* ]] && return

# source my env vars
. ~/.profile

# correctly display non-ascii characters in ssh
LC_CTYPE='en_US.UTF-8'

# history stuff {{{

# append to history file instead of overwriting
shopt -s histappend
# avoid having duplicate entries in history
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}erasedups:ignoredups
# write stuff immediately (@multiple terminals problem); + set term title
export PROMPT_COMMAND="history -a"
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'

# }}}

# completion options {{{

# Define to avoid stripping description in --option=description of './configure
# --help'
export COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
export COMP_TAR_INTERNAL_PATHS=1

# do not complete an empty line
shopt -s no_empty_cmd_completion

# recursively search the tree when ** is specified
shopt -s globstar

# add my completion
if [[ -d ~/.bash_completion.d ]] ; then
	. /usr/share/bash-completion/bash_completion
	for f in ~/.bash_completion.d/* ; do . $f ; done
fi

# command not found hook from pkgfile
[[ -r /usr/share/doc/pkgfile/command-not-found.bash ]] && . /usr/share/doc/pkgfile/command-not-found.bash

# }}}

# various other options {{{

# /some/path without a command runs a cd /some/path
shopt -s autocd

# directory names may contain small typos and still will be understood
shopt -s cdspell

# directory bookmarks: if a dir is in $CDPATH, I can change into its subdirs
# by referencing only its name, not whole path
#export CDPATH=".:~:~/.dirlinks"

# ^D exits bash too conveniently: require to press twice to exit
export IGNOREEOF=1

# color stderr with github.com/sickill/stderred
if [[ -f "/usr/lib/libstderred.so" ]]; then
	export LD_PRELOAD="/usr/lib/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
	export STDERRED_ESC_CODE=`echo -e "\e[0;32m"`
fi

# }}}

[[ -f "/usr/share/git/git-prompt.sh" ]] && . /usr/share/git/git-prompt.sh  # __git_ps1 was moved here
function parse_scm { # {{{
	if [[ -d .svn ]] ; then
		echo " svn:r`svnversion | sed 's/M/\*/'`"
	else
		if [[ `type -t __git_ps1` == 'function' ]] ; then
			echo -n "$(__git_ps1 ' git:%s')"
			[[ -n `__git_ps1` ]] && [[ `git status 2> /dev/null | tail -n1` != "nothing to commit, working directory clean" ]] && echo -n "*"
		fi
	fi
}

# do not let virtualenv activate scripts control display of virtualenv in my prompt (so that I can do it myself)
VIRTUAL_ENV_DISABLE_PROMPT=1
function _my_virtualenv_prompt {
	[[ -n "$VIRTUAL_ENV" ]] && echo -ne "\033[1;35m(`basename \"$VIRTUAL_ENV\"`)\e[0m"
}

# }}}

# aliases {{{

alias ls='ls -hC --color=auto'
alias grep='grep --color=auto'
which colordiff &>/dev/null && alias diff=colordiff

alias df='df -h'
alias du='du -h'
alias free='free -m'

alias psc='ps xawf -eo pid,user,cgroup,args'

alias l='ls'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias lld='ls -ld'

#alias ..='cd ..'

alias e=' $EDITOR'
alias ce='subl3'
alias v='$PAGER'
alias se='sudo $EDITOR'
alias o='xdg-open'

alias mkdir='mkdir -p'

[[ -n `which trash 2>/dev/null` ]] && alias rm='trash' # because I am an idiot

alias shortps1="export PS1='\[\033[0;34m\]>\[\033[0m\] '"
alias serveme='python3 -m http.server'
alias icoffee='rlwrap coffee -i'
alias todo='subl ~/TODO'

[[ -f ~/.bash_aliases.local ]] && . ~/.bash_aliases.local
# }}}

# functions {{{

# ssh with screen on the remote machine
function sshs { # reattaches to the last screen if any
	export TERM=rxvt # I don't like "unknown terminal type"
	ssh -t "$1" screen -RR
}
function sshn { # new screen
	export TERM=rxvt # I don't like "unknown terminal type"
	ssh -t "$1" screen
}

alias s='mosh'  # and the mosh awesomeness gets s

# uploads stdin to the sprunge.us pastebin
function pasteit {
	URL="`curl -F 'sprunge=<-' http://sprunge.us | tr -d ' '`"
	[[ -n $DISPLAY ]] && echo "$URL" | xsel -i
	echo "$URL"
}

# set terminal title
function settitle { # does not work for screen (yet -- this is a TODO)
	if [[ $TERM == urxvt ]]; then
		_CURRENT_TITLE="$@"
		printf \\033]0\;\%s\\007 "$@"
	fi
}

# a "multi-alias" for svn or git status
function st {
	scm=$(parse_scm)
	${scm%:*} status
}

# open ST3 with the correct project
function p {
	PROJECT_FILE='.this.sublime-project'
	subl3 --project "$PROJECT_FILE"
}

# }}}

settitle "$USER@$HOSTNAME"

export PROMPT_COMMAND="$PROMPT_COMMAND ; settitle \$_CURRENT_TITLE"

[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

# prompt {{{

[[ -z $HOST_COLOR ]] && HOST_COLOR="$((${#HOSTNAME}%6 + 2))"  # works perfectly for like 5 machines, this is the best "hash" function ever :D

export PS1='$(R=$? ; [[ $R != 0 ]] && echo -n "\[\033[0;33m\]?$R ")$(_my_virtualenv_prompt)\[\033[0;3${HOST_COLOR}m\]\u\[\033[0m\]@\[\033[0;3${HOST_COLOR}m\]\h\[\033[0;36m\] \w\[\033[0;31m\]$(parse_scm)\[\033[0m\] \$ '

# }}}

# vim: set noet ts=8 sw=8 fdm=marker fdl=99:
