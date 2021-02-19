" filetype off

let $VIMBUNDLE = $HOME . '/.vim/bundle'
let $NEOBUNDLEPATH = $VIMBUNDLE . '/neobundle.vim'
let $MYVIMRC = $HOME . '/.vim/init.vim'

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath& runtimepath+=$NEOBUNDLEPATH
endif

if !isdirectory($NEOBUNDLEPATH)
  command! NeoBundleInit try | call s:neobundle_init()
    \| catch /^neobundleinit:/
      \| echohl ErrorMsg
      \| echomsg v:exception
      \| endtry

  autocmd! VimEnter * redraw
    \| echohl WaringMsg
    \| echo "You should do ':NeoBundleInit' at first !"
    \| echohl None
endif

function! s:neobundle_init()
  redraw | echo "Installing neobundle.vim ..."

  if !isdirectory($VIMBUNDLE)
    call mkdir($VIMBUNDLE, 'p')
    echo printf("Creating '%s'.", $VIMBUNDLE)
  endif

  cd $VIMBUNDLE

  if executable('git')
    call system('git clone git@github.com:Shougo/neobundle.vim.git')

    if v:shell_error
      throw 'neobundleinit: Git error.'
    endif
  endif

  call neobundle#begin(expand($VIMBUNDLE))

  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'editorconfig/editorconfig-vim'
  NeoBundle 'justmao945/vim-clang'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'fatih/vim-go'
  NeoBundle 'mattn/vim-lsp-settings'

  call neobundle#end()

  NeoBundleCheck

  try
    echo printf("Reloading '%s'", $MYVIMRC)
    source $MYVIMRC
  catch
    echohl ErrorMsg
    echomsg 'neobundleinit: $MYVIMRC: could not source'
    echohl None
    return 0
  finally
    echomsg 'Installed neobundle.vim'
  endtry

  echomsg 'Finish !'
endfunction

" Plugin Settings

""" vim-clang
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

let g:clang_auto = 0
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ –pedantic-errors'
let g:clang_format_auto = 1
let g:clang_format_style = 'Google'
let g:clang_check_syntax_auto = 1

let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"""

""" typescript-vim
" autocmd BufNewFile,BufRead *.tsx,*.jsx
set filetype=typescript.tsx
"""

"

filetype plugin indent on
syntax on

if !has('vim_starting')
  call neobundle#call_hook('on_source')
endif
