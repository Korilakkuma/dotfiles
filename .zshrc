autoload -U compinit
compinit

autoload -Uz colors
colors

setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars

if [ ! -e ".zsh_history" ]
then
    touch .zsh_history
fi

HISTFILE=~/.zsh_history
SAVEHIST=1000000
HISTSIZE=1000000

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

export LANG=ja_JP.UTF-8
export PS1=MacBook-Pro%%\ 
export PATH=$HOME/.nodebrew/current/bin:$PATH
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
