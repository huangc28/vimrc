if has("clipboard") " yank to clipboard
     set clipboard=unnamed " copy to the system clipboard
       if has("unnamedplus") " X11 support
               set clipboard+=unnamedplus
                 endif
             endif


" Remove all trailing whitespace by pressing F5
" @see https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespace()
   let l:save = winsaveview()
   keeppatterns %s/\s\+$//e
   call winrestview(l:save)
endfun

" map trim white space on save / write to buffer.
noremap <Leader>w :call TrimWhitespace()
autocmd BufWritePre * :call TrimWhitespace()
