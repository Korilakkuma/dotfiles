export LANG=ja_JP.UTF-8
export EDITOR=vim
export CLICOLOR=1

case $OSTYPE in
  darwin* )
    PROCESSOR=$(uname -p)

    if [ "${PROCESSOR}" = "arm" ]
    then
      # Apple Silicon
      export ZPLUG_HOME=/opt/homebrew/opt/zplug
    else
      # Intel Mac
      export ZPLUG_HOME=/usr/local/opt/zplug
    fi

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

# for Apple Silicon
export PATH=$PATH:/opt/homebrew/bin

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

go env -w GOPATH="$HOME/.go"

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
