let g:vimwiki_list = [
      \ 	{'path': '~/vimwiki/notes', 'syntax': 'markdown', 'ext': '.md'},
      \ 	{'path': '~/vimwiki/gc', 'syntax': 'markdown', 'ext': '.md'}
      \]

" disable the <tab> mapping provided by vimwiki, which interferes with SuperTab
let g:vimwiki_table_mappings = 0

let g:vimwiki_listsyms = '    X'
let g:vim_markdown_frontmatter = 1
