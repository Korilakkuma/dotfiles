let g:false = 0
let g:true  = 1

function! s:glob(from, pattern)
  return split(globpath(a:from, a:pattern), "[\r\n]")
endfunction

function! s:source(from, ...)
  let found = g:false
  for pattern in a:000
    for script in s:glob(a:from, pattern)
      execute 'source' escape(script, ' ')
      let found = g:true
    endfor
  endfor
  return found
endfunction

function! s:load(...) abort
  let base  = expand($HOME.'/.vim/')
  let found = g:true

  if len(a:000) > 0
    " Stop to load
    if index(a:000, g:false) != -1
      return g:false
    endif
    for file in a:000
      if !s:source(base, file)
        let found = s:source(base, file)
      endif
    endfor
  else
    " Load all files starting with number
    let found = s:source(base, '*.vim')
  endif

  return found
endfunction

call s:load('basic.vim')
call s:load('plugins.vim')
