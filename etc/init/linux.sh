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
sudo apt -y install ffmpeg
sudo apt -y install gimp
sudo apt -y install git
sudo apt -y install htop
sudo apt -y install imagemagick
sudo apt -y install inkscape
sudo apt -y install intltool intltool-debian  # for GNU gettext library
sudo apt -y install libtool
sudo apt -y install lv
sudo apt -y install net-tools
sudo apt -y install tmux
sudo apt -y install vim
sudo apt -y install zsh

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
curl -fsSL https://get.deta.dev/cli.sh | sh
