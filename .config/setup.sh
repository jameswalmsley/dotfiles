#!/bin/bash

set -x

curl -sL install-node.now.sh/lts | sudo bash

# Clone tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

deb_packages="nodejs tmux npm python3-pip yarn"

sudo apt update
sudo apt -y install ${deb_packages}

pip3 install powerline-status

# Python support for Coc (CocInstall coc-python)
pip3 install jedi

# Some yarn stuff to build coc plugins for VIM/NVIM
sudo npm install -g npx

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -L https://get.oh-my.fish | fish

pip3 install --user --upgrade pynvim
pip3 install --user --upgrade nvim-remote

