function! vcs#git#is_git() abort
  if !exists('b:vcs_git_is_git')
    let b:vcs_git_is_git = vcs#git#project_root() != ''
  endif
  return b:vcs_git_is_git
endfunction

function! vcs#git#project_root() abort
  let l:path = fnameescape(expand('%:p:h'))
  let l:root = system('cd ' . l:path . '; echo -n `git rev-parse --show-toplevel`')
  if isdirectory(l:root)
    return l:root
  endif
  return ''
endfunction
