if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#set -o vi

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="vim"
alias grep="grep --color=auto"
alias ll="ls -l"
alias lla="ls -la"
export LESS=" -R -I "

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

if [ -f /usr/local/bin/src-hilite-lesspipe.sh ]; then
    export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
fi

[[ -s "/Users/oskar/.rvm/scripts/rvm" ]] && source "/Users/oskar/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export WORKON_HOME=~/.virtualenvs
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"
#workon mycup

# Locale
export LC_ALL=sv_SE.UTF-8

function getjq {
    curl -L http://code.jquery.com/jquery-latest.js > jquery.js
}

function serve {
    #TODO: Figure out how to also open webpage with open http://localhost:8000 without
    # putting the server in the background
    python -mSimpleHTTPServer &
    open http://localhost:8000;
    fg
}

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:/Users/oskar/Code/Python/pyutil:$PYTHONPATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home
