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
      export PATH=/opt/homebrew/bin:$PATH
      export PATH=/opt/homebrew/opt/unzip/bin:$PATH
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

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH

go env -w GOPATH="$HOME/.go"

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
