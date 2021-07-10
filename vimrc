""
"" Basic Setup
""

set nocompatible	" Use vim, no vi defaults
set number
set ruler
set t_Co=256
syntax enable
set encoding=utf-8
set autowrite
let mapleader = ","
map <Leader>m :!clear;make<Enter>
map <Leader>t :!clear;make test<Enter>
map <Leader>n :NERDTree<Enter>
set relativenumber
set wildignorecase
set clipboard=unnamed

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

" noremap <leader>w :w<cr>

" Pluging management with https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ntpeters/vim-better-whitespace'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
" Plug 'scrooloose/nerdcommenter'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
" Plug 'joonty/vdebug'
Plug 'scrooloose/nerdtree'
Plug 'chr4/nginx.vim'
Plug 'keith/swift.vim'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'mxw/vim-jsx'
Plug 'vim-syntastic/syntastic'
Plug 'posva/vim-vue'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chase/vim-ansible-yaml'
Plug 'posva/vim-vue'
Plug 'martindelille/vim-martin'
Plug 'peterhoeg/vim-qml'
Plug 'martindelille/vim-qmake'
Plug 'djoshea/vim-autoread'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'nelsyeung/twig.vim'
Plug 'lilyinstarlight/vim-sonic-pi'
Plug 'vhdirk/vim-cmake'

call plug#end()

filetype plugin on
filetype plugin indent on

" Airline setup
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode

" Theme setup
if isdirectory(expand("~/.vim/plugged/goldenrod.vim"))
"    let g:solarized_termcolors=256
    set background=dark
"    color solarized
    colorscheme goldenrod
end

au BufReadPost conanfile.txt set syntax=toml
autocmd BufNewFile,BufRead *.recordr set syntax=yaml
autocmd BufNewFile,BufRead *.ttal set syntax=json
autocmd BufNewFile,BufRead *.vcv set syntax=json
