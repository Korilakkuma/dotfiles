ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
brew install mysql
brew install nginx
brew install nkf
brew install pkgconfig
brew install pyenv
brew install rbenv
brew install tmux
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install vim
brew install wget
brew install zsh

# brew cask install adobe-creative-cloud
brew cask install docker
brew cask install firefox
brew cask install google-chrome
# brew cask install google-chrome-canary
brew cask install iterm2
brew cask install libreoffice
brew cask install microsoft-edge
# brew cask install opera
brew cask install sketch
brew cask install slack
brew cask install vlc

curl -L git.io/nodebrew | perl - setup

# brew cleanup
