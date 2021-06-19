function! vcs#perforce#is_perforce() abort
  if !exists('b:vcs_perforce_is_perforce')
    let b:vcs_perforce_is_perforce = vcs#perforce#project_root() != ''
  endif
  return b:vcs_perforce_is_perforce
endfunction

function! vcs#perforce#project_root() abort
  let l:path = fnameescape(expand('%:p:h'))
  let l:root = system('cd ' . l:path . '; echo -n `p4 -F %clientRoot% info`')
  if isdirectory(l:root)
    return l:root
  endif
  return ''
endfunction
