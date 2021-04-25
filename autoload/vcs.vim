function! vcs#project_root() abort
  if vcs#git#is_git()
    return vcs#project_root()
  endif
  return ''
endfunction

function! vcs#relative_path() abort
  if vcs#git#is_git()
    return vcs#git#relative_path()
  endif
  let l:file = expand('%:t')
  return l:file !=# '' ? l:file : '[No Name]'
endfunction

function! vcs#short_relative_path() abort
  let l:path = vcs#git#relative_path()
  if len(l:path) > 40
    return substitute(l:path, '\([^/]\)[^/]*/', '\1/', 'g')
  endif
  return l:path
endfunction
