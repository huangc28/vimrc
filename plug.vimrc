call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'schickling/vim-bufonly'
Plug 'Yggdroot/indentLine'
Plug 'storyn26383/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'kylef/apiblueprint.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'toyamarinyon/vim-swift'
Plug 'udalov/kotlin-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'morhetz/gruvbox'
Plug 'breuckelen/vim-resize'
Plug 'SirVer/ultisnips'

" Rust plugin
Plug 'rust-lang/rust.vim'
Plug 'mattn/webapi-vim'
Plug 'racer-rust/vim-racer'

" Javascript plugins
Plug 'posva/vim-vue'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'

" dart plugins
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

" plist extension (for electron MacOS)
Plug 'darfink/vim-plist'

" nvim tree sitter is a typescript parser
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-commentary'

" nvim-ts-context-commentstring comments .tsx code.
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

call plug#end()
