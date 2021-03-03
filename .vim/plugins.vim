let $VIMBUNDLE = $HOME . '/.vim/bundle'
let $VUNDLEPATH = $VIMBUNDLE . '/Vundle.vim'
let $MYVIMRC = $HOME . '/.vim/init.vim'

filetype off

set rtp+=$VUNDLEPATH

if !isdirectory($VUNDLEPATH)
  redraw | echo "Installing Vundle.vim ..."

  if !isdirectory($VIMBUNDLE)
    call mkdir($VIMBUNDLE, 'p')
    echo printf("Creating '%s'.", $VIMBUNDLE)
  endif

  cd $VIMBUNDLE

  if executable('git')
    echo "git clone https://github.com/VundleVim/Vundle.vim.git"

    call system('git clone https://github.com/VundleVim/Vundle.vim.git')

    if v:shell_error
      throw 'Git error.'
    endif

    echomsg 'Installed Vundle.vim'
    echomsg "You should do ':PluginInstall' at next !"
  endif
endif

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'Shougo/deoplete.nvim'

if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

" for Language (C/C++, TypeScript, Go, HTML/CSS)
" Plugin 'Shougo/neocomplete.vim'
Plugin 'justmao945/vim-clang'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'alvan/vim-closetag'

" for Linter, Formatter
Plugin 'mattn/vim-lsp-settings'

" for git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" for utils
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'

call vundle#end()

" Plugin Settings

""" netrw
let g:netrw_liststyle=1
let g:netrw_banner=0
let g:netrw_sizestyle='H'
let g:netrw_preview=1
"""

""" neocomplete
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType javascript,typescript setlocal omnifunc=javascriptcomplete#CompleteJS
"""

""" vim-clang
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
"""

""" typescript-vim
" autocmd BufNewFile,BufRead *.tsx,*.jsx
set filetype=typescript.tsx
"""

"

filetype plugin indent on
syntax on
