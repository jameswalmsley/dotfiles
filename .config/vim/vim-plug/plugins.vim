" auto-install vim-plug
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
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
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
Plug 'preservim/nerdcommenter'
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
Plug 'puremourning/vimspector'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

