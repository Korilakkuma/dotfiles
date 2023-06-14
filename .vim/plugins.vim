let $VIMBUNDLE  = $HOME . '/.vim/bundle'
let $VUNDLEPATH = $VIMBUNDLE . '/Vundle.vim'
let $MYVIMRC    = $HOME . '/.vim/init.vim'

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

" LSP (Language Server Protocol)
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'hrsh7th/vim-vsnip'
Plugin 'hrsh7th/vim-vsnip-integ'

" CMake
Plugin 'pboettch/vim-cmake-syntax'

" Edit
Plugin 'editorconfig/editorconfig-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'alvan/vim-closetag'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Util
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-surround'

" Colorscheme
Plugin 'tomasr/molokai'

call vundle#end()

""" LSP
let g:lsp_diagnostics_enabled=1
let g:lsp_diagnostics_echo_cursor=1
let g:lsp_diagnostics_float_cursor=0
let g:lsp_diagnostics_virtual_text_enabled=0
"""

""" netrw
let g:netrw_liststyle=1
let g:netrw_banner=0
let g:netrw_sizestyle='H'
let g:netrw_preview=1
"""

filetype plugin indent on
syntax on
colorscheme molokai
