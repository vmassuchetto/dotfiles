
# Interactive only
[ -z "$PS1" ] && return

# colors
BLACK="\[\033[0;30m\]"
BLACKBOLD="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
REDBOLD="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
GREENBOLD="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOWBOLD="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEBOLD="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEBOLD="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYANBOLD="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEBOLD="\[\033[1;37m\]"

# vim is the default editor
export EDITOR="vim"

# allow 32³ entries in bash history
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer Brazilian Portuguese and use UTF-8
export LANG="pt_BR.UTF-8"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Append history entries
shopt -s histappend

# Case-insensitive globbing for pathname expansions
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Colors
case "$TERM" in
xterm*|rxvt*)
    export PS1="[$GREENBOLD\u@\h\[\033[00m\] $BLUEBOLD\W\[\033[00m\]]\\$ "
    ;;
*)
    ;;
esac

# Use trash-cli to rm files to Gnome trash
[ -x /usr/bin/trash-put ] && alias rm='trash-put'

# Replace UNIX commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias rgrep='rgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias less='less -R'
fi

# libnotify alert
# When a command takes too much to finish, you can be notified by doing:
# $ execute_long_command_here; alert
alias alert_helper='history | tail -n1 | sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'
alias alert='notify-send "$(alert_helper)"'

# Bash completion
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Custom commands in a separated file
# * ssh aliases like          alias hostname='ssh user@host'
# * PATH additions            PATH=$PATH:~/.bin
# * Git credentials           GIT_AUTHOR_NAME, GIT_COMMITER_NAME ...
[ -f ~/.bash_extras ] && source ~/.bash_extras
