set nocompatible
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

set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4
set autoindent

set backspace=indent,eol,start
set termguicolors
autocmd vimenter * silent! lcd %:p:h

let mapleader=" "

" Color-schemes work on real VIM.
if !has('nvim')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Remove trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kana/vim-arpeggio'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'tpope/vim-sleuth'
Plug 'universal-ctags/ctags'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-sensible'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'unblevable/quick-scope'
Plug 'ryanoasis/vim-devicons'
if has('nvim')
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'takac/vim-hardtime'
Plug 'gcmt/taboo.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'moll/vim-bbye'
Plug 'liuchengxu/vim-which-key'
Plug 'airblade/vim-gitgutter'
Plug 'voldikss/vim-floaterm'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'morhetz/gruvbox'
call plug#end()

source ~/.config/vim/plug-config/limelight.vim
source ~/.config/vim/plug-config/nerdtree.vim
source ~/.config/vim/plug-config/goyo.vim
source ~/.config/vim/plug-config/quickscope.vim
source ~/.config/vim/plug-config/sneak.vim

set background=dark
" colorscheme solarized8_flat
colorscheme codedark

" Use arpeggio to map j&k simultaneously pressed to <Esc>
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
"imap jk <Esc>

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



map <leader>d :Bdelete<CR>


nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" let g:hardtime_default_on = 1

let g:list_of_normal_keys = ["j", "k", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []

let g:firenvim_config = {
    \ 'localSettings': {
        \ 'riot.im': {
            \ 'selector': '',
        \ },
        \ 'slack.com': {
            \ 'selector': '',
        \ }
    \ }
\ }


let g:ctrlp_custom_ignore = 'out|build|.git'
set sessionoptions+=tabpages,globals

com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

nnoremap = :FormatXML<Cr>

source ~/.config/vim/coc.nvim.vim
let g:airline#extensions#coc#enabled = 1
function! CocMinimalStatus() abort
  return get(b:, 'coc_git_blame', '')
endfunction

let g:airline_section_c = '%t %#LineNr#%{CocMinimalStatus()}'

nnoremap <silent> <C-b>     :make<CR>
nnoremap <silent> <C-b>b    :make<CR>
nnoremap <silent> <C-b>c    :make clean<CR>
nnoremap <silent> <C-b>dc   :make distclean<CR>
nnoremap <silent> <C-b>C    :terminal make menuconfig<CR>

" if has('nvim')
"   " Get the exit status from a terminal buffer by looking for a line near the end
"   " of the buffer with the format, '[Process exited ?]'.
"   func! s:getExitStatus() abort
"     let ln = line('$')
"     " The terminal buffer includes several empty lines after the 'Process exited'
"     " line that need to be skipped over.
"     while ln >= 1
"       let l = getline(ln)
"       let ln -= 1
"       let exitCode = substitute(l, '^\[Process exited \([0-9]\+\)\]$', '\1', '')
"       if l != '' && l == exitCode
"         " The pattern did not match, and the line was not empty. It looks like
"         " there is no process exit message in this buffer.
"         break
"       elseif exitCode != ''
"         return str2nr(exitCode)
"       endif
"     endwhile
"     throw 'Could not determine exit status for buffer, ' . expand('%')
"   endfunc
"
"   func! s:afterTermClose() abort
"     if s:getExitStatus() == 0
"       bdelete!
"     endif
"   endfunc
"
"   augroup MyNeoterm
"     autocmd!
"     " The line '[Process exited ?]' is appended to the terminal buffer after the
"     " `TermClose` event. So we use a timer to wait a few milliseconds to read the
"     " exit status. Setting the timer to 0 or 1 ms is not sufficient; 20 ms seems
"     " to work for me.
"     autocmd TermClose * call timer_start(20, { -> s:afterTermClose() })
"   augroup END
"
"   autocmd TermOpen * startinsert
" endif
"
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" s is for search
let g:which_key_map['s'] = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

set timeoutlen=500
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

nnoremap <silent> <leader>tt :FloatermToggle <CR>
nnoremap <silent> <leader>tf :FloatermNew fzf <CR>
nnoremap <silent> <leader>tcg :colorscheme gruvbox <CR>
nnoremap <silent> <leader>tcs :colorscheme solarized8 <CR>
nnoremap <silent> <leader>tcc :colorscheme codedark <CR>

let g:which_key_map['t'] = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

