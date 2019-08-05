":nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
":vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>
"'function! GrepOperator(type)
"    echom  "answer is " .a:type
"endfunction


"step 1 basic
":nnoremap <leader>g :grep -R uma . <cr>

"step 2 refine it to search the word under cursor

"uma-raj

":nnoremap <leader>g : grep -R <cword> . <cr>

"chnage it to work with execute

":nnoremap <leader>g :execute "grep -R " . '<cWORD>' . " . <cr>"

":nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " . "<cr>
"
"nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
"vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>
"
"function! GrepOperator(type)
"    echom a:type
"endfunction


nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

	:silent execute "grep! -R " . shellescape(@@) . " ."
    copen
endfunction
