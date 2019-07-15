ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew install docker
brew install ffmpeg --with-libvpx
brew install git
brew install go
brew install hugo
brew install imagemagick --with-webp
brew install jq
brew install tmux
brew install vim
brew install wget
brew install zsh

brew cask install google-chrome
brew cask install google-chrome-canary
brew cast install firefox
brew cast install opera
brew cast install iterm2
brew cast install sketch
brew cask install slack
brew cask install libreoffice
brew cask install vlc

curl -L git.io/nodebrew | perl - setup

brew cleanup
