filetype off

let $VIMBUNDLE = '~/.vim/bundle'
let $NEOBUNDLEPATH = $VIMBUNDLE . '/neobundle.vim'
let $MYVIMRC = '~/.vim/init.vim'

if has('vim_starting')
  set nocompatible
endif

if stridx(&runtimepath, $NEOBUNDLEPATH) == -1
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

if !has('vim_starting')
    call neobundle#call_hook('on_source')
endif

function! s:neobundle_init()
  redraw | echo "Installing neobundle.vim ..."

  if !isdirectory($VIMBUNDLE)
    call mkdir($VIMBUNDLE, 'p')
    echo printf("Creating '%s'.", $VIMBUNDLE)
  endif

  cd $VIMBUNDLE

  if executable('git')
    call system('git clone git://github.com/Shougo/neobundle.git')

    if v:shell_error
      echo 'neobundleinit: Git error.'
      " throw 'neobundleinit: Git error.'
    endif
  endif

  set runtimepath& runtimepath+=$NEOBUNDLEPATH

  call neobundle#begin(expand('~/.vim/bundle'))

  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'Rip-Rip/clang_complete'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'fatih/vim-go'

  let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

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

" set rtp+=~/.vim/bundle/Vundle.vim

" call vundle#begin()

" Plugin 'gmarik/Vundle.vim'
" Plugin 'leafgarland/typescript-vim'

" call vundle#end()

filetype plugin on
