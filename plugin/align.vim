if exists('g:loaded_align_nvim')
  finish
endif

command! -range=% -nargs=1 Align lua require'align'.align(<f-args>)

let g:loaded_align_nvim = 1
