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
map <Leader>m :!make<Enter>
map <Leader>n :NERDTree<Enter>
set relativenumber

""
"" Whitespace
""

set nowrap
set tabstop=4
set shiftwidth=4
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

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ntpeters/vim-better-whitespace'
Plug 'bling/vim-airline'
" Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
" Plug 'scrooloose/nerdcommenter'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
" Plug 'joonty/vdebug'
Plug 'scrooloose/nerdtree'
" Plug 'tomlion/vim-solidity'
" Plug 'dermusikman/sonicpi.vim'
Plug 'acoustichero/goldenrod.vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'keith/swift.vim'
Plug 'dag/vim-fish'
Plug 'fatih/vim-go'
Plug 'mxw/vim-jsx'
Plug 'vim-syntastic/syntastic'
Plug 'posva/vim-vue'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chase/vim-ansible-yaml'

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
