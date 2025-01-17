sudo apt -y update
sudo apt -y upgrade

# for ALSA
sudo apt -y install libasound2-dev
sudo apt -y install libflac-dev
sudo apt -y install libfltk1.3-dev
sudo apt -y install libsndfile1-dev

sudo apt -y install at
sudo apt -y install binutils
sudo apt -y install build-essential
sudo apt -y install clang-format
sudo apt -y install curl
sudo apt -y install docker.io
sudo apt -y install ffmpeg
sudo apt -y install gccgo-go
sudo apt -y install git
sudo apt -y install golang-go
sudo apt -y install gtkwave
sudo apt -y install htop
sudo apt -y install imagemagick
sudo apt -y install intltool intltool-debian  # for GNU gettext library
sudo apt -y install iverilog
sudo apt -y install libncurses5-dev libncursesw5-dev
sudo apt -y install libtool
sudo apt -y install lv
sudo apt -y install net-tools
sudo apt -y install shellcheck
sudo apt -y install tmux
sudo apt -y install traceroute
sudo apt -y install vim
sudo apt -y install zsh

sudo snap install gimp
sudo snap install inkscape

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
