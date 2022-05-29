source $ZPLUG_HOME/init.zsh

# command
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

# `cd`
zplug "b4b4r07/enhancd"

# util
zplug "mafredri/zsh-async"

# theme, color
zplug "sindresorhus/pure"
zplug "chrissicool/zsh-256color"

# zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

if ! zplug check;
then
  printf "Install? [y/N]: "  # no line break

  if read -q:
  then
    echo ""  # for line break
    zplug install
  fi
fi

zplug load --verbose
