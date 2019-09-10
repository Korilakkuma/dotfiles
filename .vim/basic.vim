language en_US.UTF-8

set encoding=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

set number
set cursorline
"set cursorcolumn
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set statusline=2
set wildmode=list:longest

nnoremap j gj
nnoremap k gk

set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start

set ignorecase
set smartcase
set incsearch
set hlsearch

nmap <Esc><Esc> :nohlsearch<CR><Esc>
"set nohlsearch

set nrformats=

set wildmenu
set wildmode=full

set history=200

set nocompatible

syntax on

augroup source-vimrc
  autocmd!
    autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
    autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
