if !exists('g:loaded_align_nvim')
	command! -range=% -nargs=1 Align lua require'align'.align(<f-args>)
	command! -nargs=+ AlignLines lua require'align'.align_lines(<f-args>)
	let g:loaded_align_nvim = 1
endif

