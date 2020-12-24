
autocmd vimenter * silent! lcd %:p:h

" Remove trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e
