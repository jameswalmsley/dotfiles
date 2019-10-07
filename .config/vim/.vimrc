set nocompatible
filetype plugin on

set ttymouse=xterm2
set mouse=a

set rtp+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2
let g:Powerline_symbols = "fancy"

set number
set relativenumber

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kana/vim-arpeggio'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

