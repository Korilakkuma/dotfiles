/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

brew install clang-format
brew install cloc
brew install cmake
brew install composer
brew install direnv
brew install docker
brew install editorconfig
brew install ffmpeg
brew install git
brew install go
brew install hugo
brew install imagemagick
brew install jq
brew install lv
brew install llvm
brew install mysql
brew install neovim
brew install nginx
brew install nkf
brew install pkgconfig
brew install pyenv
brew install rbenv
brew install telnet
brew install tmux
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install vim
brew install wget
brew install zsh

brew install --cask adobe-creative-cloud
brew install --cask docker
brew install --cask firefox
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask iterm2
brew install --cask libreoffice
brew install --cask microsoft-edge
brew install --cask opera
brew install --cask sketch
brew install --cask slack
brew install --cask vlc

curl -L git.io/nodebrew | perl - setup

# brew cleanup
