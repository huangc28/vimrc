"====================== Settings =======================
syntax on
set encoding=UTF-8
set nu
set hlsearch
set incsearch
set ignorecase
set autoread
set nocompatible
set nobackup " no *~ backup files
set noswapfile
set nowritebackup

" tabwise settings, makes the code look the same everywhere
set tabstop=2
set shiftwidth=2
set softtabstop=2


" Use additional block to set indentation for exception
if has("autocmd")
  augroup styles
    autocmd!
    " Custom filetypes settings: Python, Shell, Go, JSON
    au FileType python,sh set tabstop=4 shiftwidth=4 softtabstop=4
    au FileType go set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
		autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
		autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab smartindent
		autocmd Filetype json let g:indentLine_setConceal = 0
  augroup END
endif

set tags+=~/.vim/tags,./tags,tags;
set hidden " leave buffer without save
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set laststatus=2
set statusline+=%F
set lazyredraw
set rnu

"Get the 2-space YAML as the default when hit carriage return after the colon
set is hlsearch ai ic scs

"===================== folding ===========================
" Ref: https://medium.com/vim-drops/javascript-folding-on-vim-119c70d2e872#:~:text=We'll%20be%20specific%20and,recursively%20(nested%20folds)%20too.
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
