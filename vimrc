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

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ntpeters/vim-better-whitespace'
" Plug 'bronson/vim-trailing-whitespace'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
" Plug 'scrooloose/nerdcommenter'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'editorconfig/editorconfig-vim'
Plug 'joonty/vdebug'
Plug 'scrooloose/nerdtree'
Plug 'tomlion/vim-solidity'
Plug 'dermusikman/sonicpi.vim'

call plug#end()

filetype plugin on
filetype plugin indent on

" Airline setup
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode

" Solarized setup
if isdirectory(expand("~/.vim/plugged/vim-colors-solarized"))
  let g:solarized_termcolors=256
  set background=dark
  color solarized
end
