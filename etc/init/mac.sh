/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# for Apple Silicon
export PATH=$PATH:/opt/homebrew/bin

brew update
brew upgrade

brew install binutils
brew install clang-format
brew install cloc
brew install cmake
brew install composer
brew install coreutils
brew install docker
brew install eza
brew install ffmpeg
brew install fzy
# brew install gawk
brew install gdb
brew install git
brew install gnu-sed
brew install gnupg pinentry-mac
brew install go
brew install htop
brew install hugo
brew install icarus-verilog
brew install imagemagick
brew install jq
brew install libomp
brew install llvm
brew install lsusb
brew install lv
brew install mysql
brew install nginx
brew install nkf
brew install pkgconfig
brew install pstree
brew install qemu
brew install rust-analyzer  # Then, `rustup component add rls rust-analysis rust-src`
brew install shellcheck
brew install simh
brew install telnet
brew install tmux
brew install tree
brew install unzip  # for CP932
brew install vim
brew install wget
brew install xquartz
brew install zplug
brew install zsh

brew install --cask adobe-creative-cloud
brew install --cask docker
brew install --cask firefox
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask gtkwave
brew install --cask iterm2
brew install --cask microsoft-edge
brew install --cask opera
brew install --cask slack
brew install --cask utm

curl -fsSL https://fnm.vercel.app/install | zsh
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

PROCESSOR=$(uname -p)

if [ "${PROCESSOR}" = "arm" ]
then
  softwareupdate --install-rosetta
fi
