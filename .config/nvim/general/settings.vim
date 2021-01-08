filetype plugin on

set shell=fish

set number
set relativenumber
set hidden
set colorcolumn=100
set nohlsearch
set showmatch
set ignorecase
set wildmode=longest,list
filetype plugin indent on
syntax on
set encoding=UTF-8

set tabstop=8
set autoindent

set updatetime=100

set backspace=indent,eol,start
set termguicolors

let g:scrolloff_fraction = 0.5

set cursorline


" Color-schemes work on real VIM.
if !has('nvim')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
" colorscheme solarized8_flat
" colorscheme codedark
" colorscheme elly
colorscheme gruvbox

set sessionoptions+=tabpages,globals

