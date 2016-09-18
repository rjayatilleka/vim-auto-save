" Turn auto_save on by default for each buffer
autocmd BufEnter * if !exists('b:auto_save') | let b:auto_save = 1 | endif

" Turn auto save on or off
function! AutoSaveToggle()
  let b:auto_save = !b:auto_save
  if b:auto_save
    echo "Auto Save is ON"
  else
    echo "Auto Save is OFF"
  endif
endfunction

command! AutoSaveToggle call AutoSaveToggle()

" Save and update auto save tick
function! AutoSave()
  if b:auto_save && &modified
    if &buftype ==# 'acwrite'
      do BufWriteCmd
    else
      silent w
    endif
    let b:autosavetick = b:changedtick
  endif
endfunction

" Autocmds
autocmd InsertLeave * call AutoSave()
autocmd CursorHold * call AutoSave()
