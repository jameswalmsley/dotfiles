set nocompatible
filetype plugin on

set shell=/bin/bash

set rtp+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2
let g:Powerline_symbols = "fancy"

set number
set relativenumber

set tabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start

" Remove trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

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
Plug 'tpope/vim-sleuth'
Plug 'universal-ctags/ctags'
Plug 'vim-nerdtree/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
call plug#end()

nnoremap <C-p> :Files<Cr>
nnoremap <C-b> :Buffers<Cr>

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

