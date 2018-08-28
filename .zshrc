autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

autoload -Uz colors
colors

setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars
setopt ignore_eof

PROMPT="[MacBook-Pro] %~ %# "

if [ ! -e ".zsh_history" ]
then
    touch .zsh_history
fi

HISTFILE=~/.zsh_history
SAVEHIST=1000000
HISTSIZE=1000000

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

export LANG=ja_JP.UTF-8
# export PS1=MacBook-Pro%%\ 
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODE_PATH='/usr/local/lib/node_modules/'
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/usr/local/go/bin

# which direnv > /dev/null
# 
# if [ $? ]
# then
#     eval $(direnv hook zsh)
# elif
# then
#     brew install direnv
# fi
