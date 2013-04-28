autoload -U compinit
autoload -U colors && colors
LIGHTBLUE='%F{110}'
LIGHTYELLOW='%F{192}'
ORANGE='%F{208}'
export PROMPT="%{$LIGHTBLUE%}%n%{$reset_color%}@%{$LIGHTYELLOW%}%M%{$reset_color%}:%{$ORANGE%}%~%{$reset_color%}$ "
export EDITOR="vim"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
bindkey -e
