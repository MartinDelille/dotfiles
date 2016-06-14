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

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'bronson/vim-trailing-whitespace'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'joonty/vdebug'
Plugin 'scrooloose/nerdtree'
Plugin 'tomlion/vim-solidity'

call vundle#end()            " required

filetype plugin on
filetype plugin indent on

" Airline setup
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode

" Solarized setup
if isdirectory(expand("~/.vim/bundle/vim-colors-solarized"))
  let g:solarized_termcolors=256
  set background=dark
  color solarized
end
