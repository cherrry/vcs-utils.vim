function! vcs#git#is_git() abort
  return vcs#git#project_root() != ''
endfunction

function! vcs#git#project_root() abort
  let l:path = fnameescape(expand('%:p:h'))
  let l:root = system('cd ' . l:path . '; echo -n `git rev-parse --show-toplevel`')
  if isdirectory(l:root)
    return l:root
  endif
  return ''
endfunction

function! vcs#git#relative_path() abort
  let l:file = expand('%:t')
  let l:root = vcs#git#project_root()
  return l:file !=# '' ? substitute(expand('%:p'), l:root, '/', '') : '[No Name]'
endfunction
