let g:mapleader = "\<Space>"
let g:maplocalleader = ','

"
" Escape Keys
"
" Use arpeggio to map j&k simultaneously pressed to <Esc>
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
"imap jk <Esc>
"

"
" Windows and Splits
"
nnoremap <silent> <C-x><Left> <C-w><Left>
nnoremap <silent> <C-x><Right> <C-w><Right>
nnoremap <silent> <C-x><Up> <C-w><Up>
nnoremap <silent> <C-x><Down> <C-w><Down>

"
" Tabs
"
map <silent> <C-t><up> :tabr<cr>
map <silent> <C-t><down> :tabl<cr>
map <silent> <C-t><left> :tabp<cr>
map <silent> <C-t><right> :tabn<cr>
map <silent> <C-t>n :tabnew<cr>
map <silent> <C-x>n :tabn<cr>
map <silent> <C-x>p :tabp<cr>
map <silent> <C-x>c :tabnew<cr>
map <silent> <C-x>t :tab terminal<cr>

"
" QuickFix
"
map <silent> <C-q> :call copen<cr>
map <silent> <C-l> :call cclose<cr>
nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>

"
" Margin / Gutter
"
" Line numbers.
map <C-x>m :set number! relativenumber!<cr>

"
" Move lines up/down.
"
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"
" Build make software.
"
nnoremap <silent> <C-b>     :make<CR>
nnoremap <silent> <C-b>b    :make<CR>
nnoremap <silent> <C-b>c    :make clean<CR>
nnoremap <silent> <C-b>dc   :make distclean<CR>
nnoremap <silent> <C-b>C    :terminal make menuconfig<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv


" C-p
nnoremap <silent> <C-p><C-p> :Files<CR>
nnoremap <silent> <C-p>c     :Commands<CR>
nnoremap <silent> <C-p>C     :CocList commands<CR>
nnoremap <silent> <C-p>b     :Buffers<CR>

nmap <Leader><Leader> <c-^>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Skylight
nnoremap <silent>       go    :Skylight!<CR>
nnoremap <silent>       gp    :Skylight<CR>

nnoremap <silent><expr> <C-f> skylight#float#has_scroll() ? skylight#float#scroll(1) : "\<C-f>"
nnoremap <silent><expr> <C-b> skylight#float#has_scroll() ? skylight#float#scroll(0) : "\<C-b>"

" Remap Riv onto a leader menu:
let g:riv_global_leader = '<Leader><r>'

" Git Gutter Next/Prev Hunks:
"
let g:gitgutter_map_keys = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

