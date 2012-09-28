if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

set -o vi

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="vim"
alias grep="grep --color=auto"
alias less="less -I"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#export LSCOLORS=Bxgxfxfxcxdxdxhbadbxbx

#export PS1="\u@\h:\w\$ "
export PS1="\[\033[38;5;110m\]\u\[\033[0m\]@\[\033[38;5;192m\]\h\[\033[0m\]:\[\033[38;5;208m\]\w\[\033[0m\]\$ "
export ARCHFLAGS="-arch x86_64"

export EDITOR="vim"

PATH="/Users/oskar/bin:/Users/oskar/opt/node/bin:/usr/local/bin:/usr/local/Cellar/gettext/0.18.1.1/bin:/usr/local/sbin":$PATH

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'


if [ -f /Users/oskar/opt/django_bash_completion ]; then
    . /Users/oskar/opt/django_bash_completion
fi

[[ -s "/Users/oskar/.rvm/scripts/rvm" ]] && source "/Users/oskar/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export WORKON_HOME=~/.virtualenvs
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

