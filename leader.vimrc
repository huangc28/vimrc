nnoremap <esc><esc> :nohls<cr>
filetype plugin indent on
autocmd FileType html setlocal ts=2 sts=2 sw=2

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType php setlocal omnifunc=phpactor#Complete
nmap <F2> :ctags -R<CR>
nmap <F4> :w<CR>:make<CR>
nmap <F5> :w<CR>
nmap <F6> :cl<CR>
nmap <F7> :! gdb <CR>
nmap <F8> :Tlist<CR>
nmap <Leader>s :LeadingSpaceToggle<CR>
nmap <Leader>l :IndentLinesToggle<CR>
nmap <Leader>b :Buffer<CR>
nmap <Leader>f :Files<CR>
nnoremap <silent> <leader>n :nohlsearch<CR>
let @" = expand("%:p")

noremap <S-n> :bnext<CR>
noremap <S-p> :bprevious<CR>
noremap <C-x> :bd<CR>

" copy the file path of the current buffer
nnoremap <Leader>c :let @+=expand('%:p')<CR>

let g:vim_markdown_folding_disabled = 1
let g:indentLine_setConceal = 0
let g:vim_markdown_conceal = 0

"========================== vim-resize ==============================
let g:vim_resize_disable_auto_mappings = 1
nnoremap <silent> <Leader><left> :CmdResizeLeft<cr>
nnoremap <silent> <Leader><down> :CmdResizeDown<cr>
nnoremap <silent> <Leader><up> :CmdResizeUp<cr>
nnoremap <silent> <Leader><right> :CmdResizeRight<cr>
