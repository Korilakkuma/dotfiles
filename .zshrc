autoload -U compinit
compinit

setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars

if [ ! -e ".zsh_history" ]
then
    touch .zsh_history
fi

HISTFILE=~/.zsh_history
SAVEHIST=1000

HISTSIZE=1000

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

export PATH=$HOME/.nodebrew/current/bin:$PATH
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/usr/local/go/bin

eval $(direnv hook zsh)
