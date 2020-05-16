"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
"
set nocompatible

" Always source these:
source ~/.config/vim/vim-plug/plugins.vim
source ~/.config/vim/general/settings.vim
source ~/.config/vim/general/functions.vim
source ~/.config/vim/keys/mappings.vim
source ~/.config/vim/keys/which-key.vim


source ~/.config/vim/plug-config/coc.nvim.vim
source ~/.config/vim/plug-config/limelight.vim
source ~/.config/vim/plug-config/nerdtree.vim
source ~/.config/vim/plug-config/goyo.vim
source ~/.config/vim/plug-config/quickscope.vim
source ~/.config/vim/plug-config/sneak.vim

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


set timeoutlen=500

nnoremap <silent> <leader>tt :FloatermToggle <CR>
nnoremap <silent> <leader>tf :FloatermNew fzf <CR>
nnoremap <silent> <leader>tcg :colorscheme gruvbox <CR>
nnoremap <silent> <leader>tcs :colorscheme solarized8 <CR>
nnoremap <silent> <leader>tcc :colorscheme codedark <CR>


