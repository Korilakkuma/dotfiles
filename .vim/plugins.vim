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
Plugin 'Shougo/neocomplete.vim'

" for Language (C/C++, TypeScript, Go, HTML/CSS)
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

""" typescript-vim
" autocmd BufNewFile,BufRead *.tsx,*.jsx
set filetype=typescript.tsx
"""

"

filetype plugin indent on
syntax on
