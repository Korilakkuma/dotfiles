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

    echo "Git clone is successful !"
  endif
endif

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'justmao945/vim-clang'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'mattn/vim-lsp-settings'

call vundle#end()

" Plugin Settings

""" typescript-vim
" autocmd BufNewFile,BufRead *.tsx,*.jsx
set filetype=typescript.tsx
"""

"

filetype plugin indent on
syntax on
