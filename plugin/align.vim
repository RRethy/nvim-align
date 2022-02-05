if exists('g:loaded_align')
  finish
endif

let g:loaded_align = 1

if exists(':Align') == 0
    command! -range=% -nargs=1 Align lua require'align'.align(<f-args>)
endif
