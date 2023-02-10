""
"" Basic Setup
""

set nocompatible	" Use vim, no vi defaults
set number
set ruler
set termguicolors
syntax enable
set encoding=utf-8
set autowrite
let mapleader = " "
" noremap <leader>w :w<cr>
map <Leader>m :!clear;make<Enter>
map <Leader>t :!clear;make test<Enter>
map <Leader>n :NERDTree<Enter>
if has('win32')
  map <Leader>m :!make<Enter>
  map <Leader>t :!make test<Enter>
endif
set relativenumber
set nohlsearch
set scrolloff=8
set colorcolumn=80
set wildignorecase
set clipboard=unnamed
set shortmess=Ot

""
"" Whitespace
""

set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list
set backspace=indent,eol,start

set listchars=tab:→\ ,trail:.,extends:>,precedes:<

""
"" Searching
""

set incsearch
set hlsearch
set ignorecase
set smartcase

""
"" Others settings
""

" Pluging management with https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'ntpeters/vim-better-whitespace'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
" Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
" Plug 'joonty/vdebug'
Plug 'scrooloose/nerdtree'
Plug 'chr4/nginx.vim'
Plug 'fatih/vim-go'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chase/vim-ansible-yaml'
Plug 'martindelille/vim-martin'
Plug 'peterhoeg/vim-qml'
Plug 'martindelille/vim-qmake'
Plug 'djoshea/vim-autoread'
Plug 'cespare/vim-toml'
Plug 'nelsyeung/twig.vim'
Plug 'lilyinstarlight/vim-sonic-pi'
Plug 'cdelledonne/vim-cmake'
Plug 'tpope/vim-liquid'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ap/vim-css-color'

call plug#end()

filetype plugin on
filetype plugin indent on

" Airline setup
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode

" Theme setup
colorscheme onehalflight
let g:airline_theme='onehalfdark'

autocmd BufNewFile,BufRead conanfile.txt set syntax=toml
autocmd BufNewFile,BufRead *.recordr set syntax=yaml
autocmd BufNewFile,BufRead *.ttal set syntax=json
autocmd BufNewFile,BufRead *.vcv set syntax=json
autocmd BufNewFile,BufRead *.qss set syntax=css
