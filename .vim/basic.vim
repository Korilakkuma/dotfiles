language en_US.UTF-8

" General
set encoding=utf-8
set nobackup
set noswapfile

" Define
set history=200
set shell=$SHELL
set tags=$HOME/.vim/systags

" Display
set cursorline
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set nrformats=
set number
set scrolloff=3
set showcmd
set showmatch

" Edit
set autoread
set backspace=indent,eol,start
set hidden
set spell
set spelllang=en,cjk
set virtualedit=block
set visualbell t_vb=
set whichwrap=b,s,h,l,<,>,[,],~
set wildmenu
set wildmode=full

" Indent
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set tabstop=2

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

" for 'redrawtime' exceeded, syntax highlighting disabled
set re=0

" Key bindings
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nmap ,sudo :w !sudo tee %<CR>

nnoremap j gj
nnoremap k gk

noremap PP "0p
noremap x "_x

nnoremap <silent><C-e> :NERDTreeToggle<CR>

cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Read vimrc automatically
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" Comment off on paste
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" Close tag
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" Jump to the last cursor position
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

" Change cursor according to vim mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
