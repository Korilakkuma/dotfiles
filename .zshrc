bindkey -e

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

autoload -Uz vcs_info
autoload -Uz colors
colors

setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars
setopt ignore_eof
setopt print_eight_bit
setopt prompt_subst
setopt no_flow_control
setopt interactivecomments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob

precmd () { vcs_info }

# PROMPT="%{$fg[green]%}[%n@%m]%{$reset_color%}"
# PROMPT="%{$fg[green]%}[%n@MacBook-Pro]%{$reset_color%}"
# PROMPT=$PROMPT"${vcs_info_msg_0_} %{${fg[green]}%}%}$%{${reset_color}%} "
# RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

# PROMPT='[%n@%m] %~ ${vcs_info_msg_0_}
# $ '
# RPROMPT=

PROMPT='[korilakkuma@%~] ${vcs_info_msg_0_}
$ '
RPROMPT=

if [ ! -e ".zsh_history" ]
then
    touch ~/.zsh_history
fi

HISTFILE=~/.zsh_history
SAVEHIST=1000000
HISTSIZE=1000000

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
# alias ctags="`brew --prefix`/bin/ctags"
# alias cctags="ctags -R -f $HOME/.vim/systags /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/*.h"
alias global="curl ifconfig.moe"
alias glog="git log --oneline --pretty=format:'%h [%ad] %d %s <%an>' --date=format:'%Y-%m-%d %H:%M:%S'"
alias history="history 0"
alias hugod="hugo server -D"
alias inet="ifconfig -a | grep -Eo 'inet [0-9.]+'"
alias mkdir="mkdir -p"
alias tmux="tmux -2 new-session \; source-file ~/.tmux/new-session"
# alias vim="nvim"
alias xsound1="curl -s 'https://api.github.com/repos/Korilakkuma/XSound/stargazers?page=1&per_page=100' -H 'Accept: application/vnd.github.v3.star+json' | jq -r '.[].starred_at'"
alias xsound2="curl -s 'https://api.github.com/repos/Korilakkuma/XSound/stargazers?page=2&per_page=100' -H 'Accept: application/vnd.github.v3.star+json' | jq -r '.[].starred_at'"

# alias vim=/usr/local/Cellar/macvim/8.1-155/bin/vim

export LANG=ja_JP.UTF-8
export EDITOR=vim
# export PS1=MacBook-Pro%%\
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.nodebrew/current/bin
# export SDKROOT=$HOME/Development/MacOSX-SDKs/MacOSX10.9.sdk
# export SDKROOT=`xcrun --sdk macosx --show-sdk-path`
export NODE_PATH='/usr/local/lib/node_modules/'
export GOPATH=$HOME/.go
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/usr/local/go/bin
export PATH=$PATH:$HOME/.composer/vendor/bin
# export PATH=$PATH:$HOME/Library/Python/2.7/bin
# export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.2/bin
export PATH=$PATH:/usr/local/opt/openssl@1.1/bin
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export CLICOLOR=1

# for emcc
# source $HOME/Sites/GitHub/emsdk/emsdk_env.sh

# which direnv > /dev/null
#
# if [ $? ]
# then
#     eval $(direnv hook zsh)
# elif
# then
#     brew install direnv
# fi

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

function llvm() {
  export PATH=$PATH:/usr/local/opt/llvm/bin
  export LDFLAGS="-L/usr/local/opt/llvm/lib"
  export CPPFLAGS="-I/usr/local/opt/llvm/include"
  unset -f llvm
}

function ccomp() {
  rm -rf ~/.zcompdump
  exec $SHELL
}
