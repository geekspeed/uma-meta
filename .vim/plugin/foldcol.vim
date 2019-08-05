nnoremap <leader>f :call FoldColToggle()<cr>

function! FoldColToggle()
if &foldcolumn
	set foldcolumn=0
else
	set foldcolumn=4
endif
endfunction


nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
"" above function uses and global variable, section 302 says thats a bloody crime
