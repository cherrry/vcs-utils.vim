function! vcs#project_root() abort
  if !exists('b:vcs_project_root')
    if vcs#git#is_git()
      let b:vcs_project_root = vcs#git#project_root()
    else
      let b:vcs_project_root = ''
    endif
  endif
  return b:vcs_project_root
endfunction

function! vcs#relative_path() abort
  let l:file = expand('%:t')
  let l:root = vcs#project_root()
  if l:root ==# ''
    return l:file
  endif
  return l:file !=# '' ? substitute(expand('%:p'), l:root, '/', '') : '[No Name]'
endfunction

function! vcs#short_relative_path() abort
  let l:path = vcs#relative_path()
  if l:path == '[No Name]'
    return l:path
  elseif len(l:path) > 48
    let l:parts = split(l:path, '/')
    let l:ptr = 0
    while len(l:path) > 48 && l:ptr < len(l:parts)
      let l:parts[l:ptr] = l:parts[l:ptr][0]
      let l:ptr = l:ptr + 1
      let l:path = '//' . join(l:parts, '/')
    endwhile
  endif
  return l:path
endfunction
