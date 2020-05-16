
nnoremap <silent> <Leader>b :NERDTreeToggle <Cr>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>


" CDC = Change to Directory of Current file
"
"map <Leader>cd :NERDTreeCWD %:p:h<cr>
map <leader>cd :lcd %:h<CR>

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"
" let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen = 1
