" auto-install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Key Mappings / bindings
Plug 'liuchengxu/vim-which-key'
Plug 'kana/vim-arpeggio'

" Vim
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'unblevable/quick-scope'
"Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'airblade/vim-rooter'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'honza/vim-snippets',
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'liuchengxu/vista.vim'
Plug 'glepnir/galaxyline.nvim'

" Language stuff
Plug 'universal-ctags/ctags'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'previm/previm'
Plug 'stsewd/sphinx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'fatih/vim-go'

" Mail
" Plug 'felipec/notmuch-vim'
" Plug 'dcbaker/vim-abook'

" IM
Plug 'twitvim/twitvim'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" Build
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" UI Features
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/vim-skylight', {'do': 'yarn install --frozen-lockfile'}
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'mbbill/undotree'
Plug 'psliwka/vim-smoothie'

Plug 'rbong/vim-flog'
if has('nvim')
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'takac/vim-hardtime'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'gcmt/taboo.vim'
Plug 'moll/vim-bbye'
Plug 'puremourning/vimspector'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
Plug 'gu-fan/riv.vim'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jparise/vim-phabricator'

" Themes
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'aonemd/kuroi.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'ulwlu/elly.vim'

" Phabricator
Plug 'jameswalmsley/phab-nvim'
"Plug '~/develop/nvim-phteven'

call plug#end()

let g:coc_global_extensions = [
			\	'coc-explorer',
			\	'coc-eslint',
			\	'coc-tslint',
			\	'coc-css',
			\	'coc-highlight',
			\	'coc-git',
			\	'coc-yank',
			\	'coc-lists',
			\	'coc-clangd',
			\	'coc-snippets',
			\	'coc-json',
			\ ]

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

