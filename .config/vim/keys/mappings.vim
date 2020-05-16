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
nnoremap <C-x>1 :only<Cr>
nnoremap <C-x>2 :split<Cr>
nnoremap <C-x>3 :vsplit<Cr>
nnoremap <C-x>o <C-w><C-w>
nnoremap <C-x><Left> <C-w><Left>
nnoremap <C-x><Right> <C-w><Right>
nnoremap <C-x><Up> <C-w><Up>
nnoremap <C-x><Down> <C-w><Down>

"
" Tabs
"
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-t>n :tabnew<cr>
map <C-x>n :tabn<cr>
map <C-x>p :tabp<cr>
map <C-x>c :tabnew<cr>
map <C-x>t :tab terminal<cr>

"
" Margin / Gutter
"
" Line numbers.
map <C-x>m :set number! relativenumber!<cr>

" Close a buffer.
map <leader>d :Bdelete<CR>

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

