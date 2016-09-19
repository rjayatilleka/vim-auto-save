" Turn auto_save on by default for each buffer
function! s:SetAutoSaveStartingValue()
  if (@% == "") || (&buftype == 'nofile')
    let b:auto_save = 0
  else
    let b:auto_save = 1
  endif
endfunction
autocmd BufEnter * if !exists('b:auto_save') | call s:SetAutoSaveStartingValue() | endif

" Turn auto save on or off
function! s:AutoSaveToggle()
  let b:auto_save = !b:auto_save
  if b:auto_save
    echo "Auto Save is ON"
  else
    echo "Auto Save is OFF"
  endif
endfunction

command! AutoSaveToggle call s:AutoSaveToggle()

" Save and update auto save tick
function! s:AutoSave()
  if exists('b:auto_save') && b:auto_save && &modified
    if &buftype ==# 'acwrite'
      do BufWriteCmd
    else
      silent w
    endif
    let b:autosavetick = b:changedtick
    execute 'do AutoSavePost' @%
  endif
endfunction

" Autocmds
autocmd InsertLeave * call s:AutoSave()
autocmd CursorHold * call s:AutoSave()
