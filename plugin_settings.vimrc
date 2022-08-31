"===================== Theos Logos ===========================
au BufNewFile,BufRead *.xm,*.xmm,*.l.mm setf logos

"===================== folding ===========================
" Ref: https://medium.com/vim-drops/javascript-folding-on-vim-119c70d2e872#:~:text=We'll%20be%20specific%20and,recursively%20(nested%20folds)%20too.
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

"===================== rust ===========================
" @see https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

" @see https://github.com/racer-rust/vim-racer
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

"===================== gruvbox ===========================
"Please refer to https://github.com/morhetz/gruvbo://github.com/morhetz/gruvbox
colorscheme gruvbox

"===================== Ctags ===========================
function! UpdateTags()
 let tags = 'tags'
 if filereadable(tags)
   let file = substitute(expand('%:p'), getcwd() . '/', '', '')
   " remove tags of file and append tags
   call system('sed -ri "/\s+' . escape(file, './') . '/d"' . tags . ' && ctags -a "' . file . '" &')
 "endif
endfunction
autocmd BufWritePost *.php,*.cpp,*.cc,*.h,*.c call UpdateTags()

"======================= ag.vim ==========================
let g:ag_working_path_mode="r"
"======================= fzf ==========================
" @ref https://aonemd.github.io/blog/finding-things-in-vim
nmap <Leader>a :Rg<CR>
nmap <Leader>p :HFiles<CR>

"@ref: https://thoughtbot.com/blog/faster-grepping-in-vim
if executable("ag")
   "" Use ag over grep
   "set grepprg=ag\ --nogroup\ --nocolor
endif

"======================= Air Line ==========================
let g:airline_theme="tomorrow"
let g:airline_powerline_fonts = 1
" set status line
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
"========================== PHP ============================
function! PhpSyntaxOverride()
   "" Put snippet overrides in this function.
   "hi! link phpDocTags phpDefine
   "hi! link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
   "autocmd!
   "autocmd FileType php call PhpSyntaxOverride()
augroup END
" php cs fixer
let g:php_cs_fixer_level = 'psr2'
let g:php_cs_fixer_enable_default_mapping = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=psr2'
" php namespace
"=========================== indentLine ============================
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_color_term = 239
let g:indentLine_leadingSpaceChar = '.'
" autocmd FileType html,css,php,c,cpp,swift,python,ruby :IndentLinesEnable
autocmd FileType html,css,php,c,cpp,swift,python,ruby,xm

"========================== Phpactor ==============================
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>
" Goto definition of class or class member under the cursor
" File type dependent key mapping: https://vi.stackexchange.com/questions/10664/file-type-dependent-key-mapping/10666
autocmd FileType php nmap <buffer> gd :call phpactor#GotoDefinition()<CR>
" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>
" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

"========================== NerdTree ==============================
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"

nmap <C-n> :NERDTreeToggle <CR>
nmap <Leader>m :NERDTreeFind <CR>

"========================== NerdCommentor ==============================
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"========================== coc.nvim ==============================

" extensions
let g:coc_global_extensions = [
 \ 'coc-snippets',
 \ 'coc-pairs',
 \ 'coc-tsserver',
 \ 'coc-eslint',
 \ 'coc-prettier',
 \ 'coc-json',
 \ ]
set hidden "Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set cmdheight=2
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <C-c> <Esc><Esc>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

let g:coc_snippet_next = '<Tab>'

"========================== go vim ==============================
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0

# https://github.com/fatih/vim-go/issues/848
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"let g:syntastic_go_checkers = ['go']


"========================== ultsnips ==============================
" make ultsnips to work with CoC
let g:UltiSnipsExpandTrigger='<Nop>'
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:python3_host_prog = "/usr/bin/python3"
