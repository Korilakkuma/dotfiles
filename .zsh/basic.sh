bindkey -e

autoload -Uz compinit
compinit

setopt auto_cd
setopt auto_pushd
setopt cdable_vars
setopt correct
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt ignore_eof
setopt interactivecomments
setopt no_flow_control
setopt noautoremoveslash
setopt print_eight_bit
setopt prompt_subst
setopt pushd_ignore_dups
setopt share_history

set -C

alias dmesg="sudo dmesg"
alias finderhp="defaults write com.apple.finder _FXShowPosixPathInTitle 0 && killall finder"
alias findersp="defaults write com.apple.finder _FXShowPosixPathInTitle 1 && killall finder"
alias global="echo $(curl ipecho.net/plain)"
alias glog="git log --oneline --pretty=format:'%h [%ad] %d %s <%an>' --date=format:'%Y-%m-%d %H:%M:%S'"
alias grep="grep --color=auto"
alias hugod="hugo server"
alias inet="ifconfig -a | grep -Eo --color=never 'inet [0-9.]+'"
alias less="less -M"
alias localserver="python3 -m http.server"
alias ls="ls -FG"
alias mkdir="mkdir -p"
alias ninstall="npm prune && npm install && npm ls colors"
alias ps="ps -Af"
alias rtable="netstat -r"
alias setup="tmux -2 new-session \; source-file ~/.tmux/new-session"
alias sort="sort -b"
alias ulimit="ulimit -a"
alias vipw="sudo vipw"
alias visudo="sudo visudo"
alias words="tr -cs a-zA-Z0-9 \"[\n*]\""
alias xsound1="curl --silent 'https://api.github.com/repos/Korilakkuma/XSound/stargazers?page=1&per_page=100' --header 'Accept: application/vnd.github.v3.star+json'"
alias xsound2="curl --silent 'https://api.github.com/repos/Korilakkuma/XSound/stargazers?page=2&per_page=100' --header 'Accept: application/vnd.github.v3.star+json'"

function ccomp() {
  rm -rf ~/.zcompdump
  exec $SHELL
}

function cpuinfo() {
  case $OSTYPE in
    darwin* )
      system_profiler SPHardwareDataType
      ;;
    linux* )
      cat /proc/cpuinfo
      ;;
    msys* )
      ;;
    * )
      ;;
  esac
}

function gstashlog() {
  git fsck --no-reflog | awk '/dangling commit/ {print $3}' > dangling_commit
  git log --oneline "$(cat dangling_commit)" | grep 'WIP on'
}

function gstashapply() {
  git stash apply "$1"
}

function gdbcert() {
  codesign -s gdbcert "$(which gdb)"
}

function llvm() {
  export PATH=$PATH:/usr/local/opt/llvm/bin
  export LDFLAGS="-L/usr/local/opt/llvm/lib"
  export CPPFLAGS="-I/usr/local/opt/llvm/include"
  unset -f llvm
}

function mcleanup() {
  for SOURCE in "$@"
  do
    if [ -f "${SOURCE}" ]
    then
      TARGET=$(echo "${SOURCE}" | sed 's/^\(.*\)\.cp\{0,2\}$/\1/')

      if [ -x "${TARGET}" ]
      then
        echo "rm -f ${TARGET}"
        rm -f "${TARGET}"
      fi
    fi
  done
}

function mgcc() {
  for SOURCE in "$@"
  do
    if [ -f "${SOURCE}" ]
    then
      TARGET=$(basename "${SOURCE}" ".c")

      case ${TARGET} in
        *\.cpp )
          TARGET=$(basename "${SOURCE}" ".cpp")
          echo "g++ -std=c++11 -O2 -Wall -o ${TARGET} ${SOURCE}"
          g++ -std=c++11 -O2 -Wall -o "${TARGET}" "${SOURCE}"
          ;;
        * )
          echo "gcc -std=c99 -O2 -Wall -o ${TARGET} ${SOURCE}"
          gcc -std=c99 -O2 -Wall -o "${TARGET}" "${SOURCE}"
          ;;
      esac
    fi
  done
}

function starlist() {
  case $1 in
    -l ) echo "$(xsound1) $(xsound2)" | jq -r '.[]|[.user]' ;;
    -n ) echo "$(xsound1) $(xsound2)" | jq -r '.[]|.starred_at' | wc -l ;;
     * ) echo "$(xsound1) $(xsound2)" | jq -r '.[]' ;;
  esac
}

if [ ! -e "${HISTFILE}" ]
then
    touch "${HISTFILE}"
fi
