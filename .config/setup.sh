#!/bin/bash

set -x

# Clone tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


deb_packages="node.js tmux npm python3-pip"


sudo apt -y install ${deb_packages}



pip3 install powerline-status

# Python support for Coc (CocInstall coc-python)
pip3 install jedi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
