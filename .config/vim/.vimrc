set nocompatible
filetype plugin on

set shell=/bin/bash

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
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'
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
call plug#end()

set background=dark
" colorscheme solarized8_flat
colorscheme codedark

:imap jk <Esc>

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

nnoremap <Leader>b :NERDTreeToggle <Cr>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>


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

map <leader>d :Bdelete<CR>

map <leader>z :Goyo<CR>
let g:goyo_width = 100

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"
" let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen = 1


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

"let g:ctrlp_show_hidden = 1
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_cmd = 'CtrlPBuffer'




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
if has('nvim')
  " Get the exit status from a terminal buffer by looking for a line near the end
  " of the buffer with the format, '[Process exited ?]'.
  func! s:getExitStatus() abort
    let ln = line('$')
    " The terminal buffer includes several empty lines after the 'Process exited'
    " line that need to be skipped over.
    while ln >= 1
      let l = getline(ln)
      let ln -= 1
      let exitCode = substitute(l, '^\[Process exited \([0-9]\+\)\]$', '\1', '')
      if l != '' && l == exitCode
        " The pattern did not match, and the line was not empty. It looks like
        " there is no process exit message in this buffer.
        break
      elseif exitCode != ''
        return str2nr(exitCode)
      endif
    endwhile
    throw 'Could not determine exit status for buffer, ' . expand('%')
  endfunc

  func! s:afterTermClose() abort
    if s:getExitStatus() == 0
      bdelete!
    endif
  endfunc

  augroup MyNeoterm
    autocmd!
    " The line '[Process exited ?]' is appended to the terminal buffer after the
    " `TermClose` event. So we use a timer to wait a few milliseconds to read the
    " exit status. Setting the timer to 0 or 1 ms is not sufficient; 20 ms seems
    " to work for me.
    autocmd TermClose * call timer_start(20, { -> s:afterTermClose() })
  augroup END

  autocmd TermOpen * startinsert
endif

