if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="vim"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export PS1="\u@\h:\w\$ "

export ARCHFLAGS="-arch x86_64"

export EDITOR="vim"

PATH="/Users/oskar/opt/play-1.2.2:/Users/oskar/bin:/usr/local/bin:Users/oskar/opt/bin:/usr/local/Cellar/gettext/0.18.1.1/bin:/usr/local/sbin:/Users/oskar/node_modules/.bin:"$PATH

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

. /Users/oskar/opt/django_bash_completion

[[ -s "/Users/oskar/.rvm/scripts/rvm" ]] && source "/Users/oskar/.rvm/scripts/rvm"
