"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
"
set nocompatible
let g:gitgutter_map_keys = 0

let g:startify_change_to_vcs_root = 0
" Always source these:
source ~/.config/nvim/vim-plug/plugins.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/functions.vim
source ~/.config/nvim/keys/mappings.vim
source ~/.config/nvim/keys/which-key.vim

source ~/.config/nvim/plug-config/airline.vim
source ~/.config/nvim/plug-config/coc.nvim.vim
source ~/.config/nvim/plug-config/coc-explorer.vim
source ~/.config/nvim/plug-config/limelight.vim
source ~/.config/nvim/plug-config/nerdtree.vim
source ~/.config/nvim/plug-config/goyo.vim
source ~/.config/nvim/plug-config/quickscope.vim
source ~/.config/nvim/plug-config/sneak.vim
source ~/.config/nvim/plug-config/floaterm.vim
source ~/.config/nvim/plug-config/vimwiki.vim
source ~/.config/nvim/plug-config/startify.vim

" let g:hardtime_default_on = 1

let g:list_of_normal_keys = ["j", "k", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []

let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'takeover': 'never',
        \ },
        \ 'riot.im': {
            \ 'selector': '',
        \ },
        \ 'slack.com': {
            \ 'selector': '',
        \ }
    \ }
\ }


