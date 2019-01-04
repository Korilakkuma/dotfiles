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

filetype off

if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

call neobundle#end()

NeoBundleCheck

if !has('vim_starting')
    call neobundle#call_hook('on_source')
endif

" set rtp+=~/.vim/bundle/Vundle.vim

" call vundle#begin()

" Plugin 'gmarik/Vundle.vim'
" Plugin 'leafgarland/typescript-vim'

" call vundle#end()

filetype plugin on
