if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="vim"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export PS1="\u@\h:\w\$ "

export ARCHFLAGS="-arch x86_64"

export EDITOR="vim"

PATH="/Users/oskar/opt:/usr/local/Cellar/gettext/0.18.1.1/bin:"$PATH

export MC="/Users/oskar/projects/myclub_app/src"

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    

