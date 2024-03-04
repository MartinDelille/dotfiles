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
let mapleader = ","
" noremap <leader>w :w<cr>
map <Leader>m :!clear;make<Enter>
map <Leader>t :!clear;make test<Enter>
map <Leader>n :NERDTree<Enter>
if has('win32')
  map <Leader>m :!make<Enter>
  map <Leader>t :!make test<Enter>
endif
map <Leader>s :w<Enter>:so $MYVIMRC<Enter>
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
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
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
Plug 'sainnhe/edge'
Plug 'ap/vim-css-color'
Plug 'github/copilot.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'matze/vim-move'
Plug 'madox2/vim-ai'
Plug 'darfink/vim-plist'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier'

let b:ale_fixers = ['prettier']

call plug#end()

filetype plugin on
filetype plugin indent on

" Airline setup
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode

" Theme setup
let g:edge_style = 'aura'
let g:edge_better_performance = 1
colorscheme edge

autocmd BufNewFile,BufRead conanfile.txt set syntax=toml
autocmd BufNewFile,BufRead *.recordr set syntax=yaml
autocmd BufNewFile,BufRead *.ttal set syntax=json
autocmd BufNewFile,BufRead *.vcv set syntax=json
autocmd BufNewFile,BufRead *.qss set syntax=css
autocmd BufRead,BufNewFile   *.txt setlocal wrap linebreak

" Git setup
command Gc Git commit -v
command Gapa Git add -p

" Copilot
let g:copilot_filetypes = {
    \ 'gitcommit': v:true,
    \ 'markdown': v:true,
    \ 'yaml': v:true
    \ }

" vim-ai
map <Leader>a :AI<CR>
map <Leader>c :AIChat<CR>

" wrap lines in chat window
let g:vim_ai_chat = {
\  "ui": {
\    "open_chat_command": "setlocal wrap | call vim_ai#MakeScratchWindow()",
\  },
\}

" custom command suggesting git commit message, takes no arguments
function! GitCommitMessageFn()
  let l:diff = system('git --no-pager diff --staged')
  let l:prompt = "generate a short commit message from the diff below:\n" . l:diff
  let l:range = 0
  let l:config = {
  \  "engine": "chat",
  \  "options": {
  \    "model": "gpt-3.5-turbo",
  \    "initial_prompt": ">>> system\nyou are a code assistant",
  \    "temperature": 1,
  \  },
  \}
  call vim_ai#AIRun(l:range, l:config, l:prompt)
"  echo "Hello, world ooo!"
endfunction
command! Gcai call GitCommitMessageFn()
map <Leader>g :Gcai<CR>

" custom command adding filetype to the instruction
function! AISyntaxFn(range, ...) range
  let l:instruction = "programming language is " . &filetype
  if a:0
    let l:instruction = l:instruction . " - " . a:1
  endif
  if a:range
    '<,'>call vim_ai#AIRun(a:range, {}, l:instruction)
  else
    call vim_ai#AIRun(a:range, {}, l:instruction)
  endif
endfunction
command! -range -nargs=? AISyntax <line1>,<line2>call AISyntaxFn(<range>, <f-args>)
