set nocompatible
filetype plugin on

set shell=/bin/bash


set number
set relativenumber
set hidden
set colorcolumn=80
set nohlsearch

set encoding=UTF-8

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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'unblevable/quick-scope'
Plug 'ryanoasis/vim-devicons'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
call plug#end()

set background=dark
colorscheme solarized8_flat

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

" Toggle Margin
map <C-x>m :set number! relativenumber!<cr>


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
"map <Leader>cd :NERDTreeCWD %:p:h<cr>
map <leader>cd :lcd %:h<CR>

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"
" let NERDTreeChDirMode=2


" Quick Scope
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"let g:qs_lazy_highlight = 1

" Map the leader key + q to toggle quick-scope's highlighting in normal/visual mode.
" Note that you must use nmap/xmap instead of their non-recursive versions (nnoremap/xnoremap).
"nmap <leader>m <plug>(QuickScopeToggle)
"xmap <leader>m <plug>(QuickScopeToggle)


nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

let g:ctrlp_show_hidden = 1
" let g:ctrlp_working_path_mode = 0

