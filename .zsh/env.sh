export LANG=ja_JP.UTF-8
export EDITOR=vim
export CLICOLOR=1

case $OSTYPE in
  darwin* )
    export ZPLUG_HOME=/usr/local/opt/zplug
    export PATH=$PATH:$HOME/.fnm
    ;;
  linux* )
    export ZPLUG_HOME=$HOME/.zplug
    ;;
  msys* )
    ;;
  * )
    ;;
esac

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

go env -w GOPATH="$HOME/.go"

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
