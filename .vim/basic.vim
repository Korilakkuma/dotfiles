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
set visualbell t_vb=
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

augroup auto_comment_off
  autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

augroup MyXML
  autocmd!
   autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
   autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
