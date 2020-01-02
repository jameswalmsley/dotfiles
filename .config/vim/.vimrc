set nocompatible
filetype plugin on

set shell=/bin/bash

set number
set relativenumber
set hidden
set colorcolumn=80
set nohlsearch

set tabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start
set termguicolors
autocmd vimenter * silent! lcd %:p:h

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set background=dark
colorscheme solarized8

nnoremap <C-p> :Files<Cr>
nnoremap <C-b> :NERDTreeToggle %:p:h<Cr>

nnoremap <C-x>1 :only<Cr>
nnoremap <C-x>2 :split<Cr>
nnoremap <C-x>3 :vsplit<Cr>
nnoremap <C-x>o <C-w><C-w>
nnoremap <C-x><Left> <C-w><Left>
nnoremap <C-x><Right> <C-w><Right>
nnoremap <C-x><Up> <C-w><Up>
nnoremap <C-x><Down> <C-w><Down>

map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-t>n :tabnew<cr>
map <C-x>n :tabn<cr>
map <C-x>p :tabp<cr>
map <C-x>c :tabnew<cr>
map <C-x>t :tab terminal<cr>

let mapleader=" "
"map \ <Leader>
map <Leader> <Plug>(easymotion-prefix)
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature

let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" CDC = Change to Directory of Current file
"
map <Leader>cd :NERDTreeCWD %:p:h<cr>


xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p


" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"
" let NERDTreeChDirMode=2

