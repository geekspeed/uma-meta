set ts=4
" ignore these files when completing names and in Ex
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.ko
" set of file name suffixes that will be given a lower priority when it comes to matching wildcards
set suffixes+=,.old
au BufNewFile *.c 0r ~/.vim/skeleton.c
""/*********************************/
""hhhello
"inoremap <left> <nop>
"inoremap <right> <nop>
"inoremap <down> <nop>
"inoremap <up> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"nnoremap <down> <nop>
"nnoremap <up> <nop>
"let mapleader="-"
":set ts=4
":set number
":let &number = 0 
"autocmd FileType python nnoremap <buffer>  -- 0i#<esc>
":autocmd FileType python     :iabbrev <buffer> iff if:<left>
":autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
"":autocmd BufWrite * :echom "Writing buffer!"
"":augroup testgroup
"":    autocmd!
"":    autocmd BufWrite * :echom "Foo"
"":    autocmd BufWrite * :echom "Bar"
"":augroup END
""
"":augroup testgroup
"":    autocmd!
"":    autocmd BufWrite * :echom "Foo"
"":    autocmd BufWrite * :echom "Bar"
"":augroup END
":onoremap in( :<c-u>normal! f(vi(<cr>
"" move to backword till 'x' char Fx fx
":onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
"" Vimscript file settings ---------------------- {{{
"augroup filetype_vim
"    autocmd!
"    autocmd FileType vim setlocal foldmethod=marker
"augroup END 
"" }}}
"augroup comment_all_files
"        autocmd!
"        autocmd FileType vim inoremap <leader>c <esc>maI"<esc>`ai
"        autocmd FileType c inoremap <leader>c <esc>0i/*<esc>$a*/
"        autocmd FileType cpp inoremap <leader>c <esc>0i/*<esc>$a*/
"        autocmd FileType python inoremap <leader>c <esc>maI#<esc>`ai
"augroup END 
"::setlocal foldmethod=marker
""g~iw
"" tilde is to switch case
"":help text-objects see this later
"" * and # to search current word
"" / c-r c-w to search for current worl
"" NUMBER\c case insensitive C case sensitive
"" \<i\> search only for i as complete word      
"" bored red 
""\<\(red\)\>
"" :%s/\<\(red\|green\|blue\)\>/"&"/g here & acts as found content
"" df> delete till next >
""c-p c-n for keyworld completion
":function Displayname(name)
"        :echom "hello"
"        :echom a:name
":endfunction
":function Vargs(...)
"        :echom a:0 
"        :echom a:1 
"        :echom a:2 
"        :echo a:000
":endfunction
"":echo 1+2
"":echo "uma-raj" + "raj"
"":echo "1uma" + "2raj"
"":echo "1uma" . "2raj"
"
"":if "1foo"
""       :echo "yes"
"":else
""       :echo "no"
"":endif
""that's
"":echo strlen("uma")
"":echo len("uma")
"":echo split("uma raju chari saraboju")
"":echo split("umaXrajuXchariXsaraboju","X")
":inoremap -vc <esc>0i"
":nnoremap -vc 0i" 
"":echo join(split("foo bar"), ";")
"":echo toupper("Foo")
"":echo tolower("Foo")
"" normal takes commands and pretends as if they were typed in normal mode. 
"" normal considers mapping, if G is mapped to dd normal G will delete line insted of reaching file end
"" normal! is a way to get around user mappings and it wont interpret special characters
""for .\+ in .\+: regular expressions + needs to be escaped
:set hlsearch incsearch 
"":execute "normal! gg" . '/for .\+ in .\+:' . "\<cr>"
""vim has 4 regex modes
"":nnoremap <leader>g :grep -R '<cword>' .<cr>
"":nnoremap <leader>g :execute "grep -R '<cword>' .<cr>"
""echom expand("<cWORD>")
"":nnoremap <leader>g :silent exe "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
"
"":for line in getline(1,"$")
"        ": do something 
"":endfor
inoremap lc <esc>mav}<esc><esc>a*/<esc>`ai/*<esc>      
""(with d, c, s or x) or yank (with y) goes to unnamed register ""
"":onoremap in( :<c-u>normal! f(vi(<cr> analyze this uma
"

"/*********************************/
"shift around
"No, if it is set, it moves it to the next multiple value of shiftwidth, 
"WHILE when it is not SET, it SIMPLY MOVES by shiftwidth chars. 
"
"Here is an example: 
"If your shiftwidth value is 4 and your input starts at cell 3 indenting 
"using >> would move the text to cell 5 if shiftround is set, while it 
"moves your text to cell 7 when shiftround is not set
:let mapleader="-"
:inoremap <c-d> <esc>ddi
:inoremap <c-u> <esc>maviwU`ali
:inoremap <c-l> <esc>maviwu`ali
:nnoremap <leader>ev :vsplit  $MYVIMRC <cr>
:nnoremap <leader>sv :source $MYVIMRC <cr>
:nnoremap H 0
:nnoremap L $
":inoremap <leader>" <esc>lbi"<esc>lea" 
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
:inoremap jk <esc>
"inoremap <left> <nop>
"inoremap <right> <nop>
"inoremap <down> <nop>
nnoremap <leader>m <c-]>
"inoremap <up> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"nnoremap <down> <nop>
"nnoremap <up> <nop>
":inoremap <esc> <nop>
set spellfile=/usr/share/vim/vim74/spell/en.utf-8.spl.add
augroup comment_all_file
	:autocmd!
	autocmd FileType c inoremap <leader>c <esc>0i/*<esc>$a*/
	autocmd FileType cpp inoremap <leader>c <esc>0i/*<esc>$a*/
	autocmd FileType python inoremap <leader>c <esc>maI#<esc>`ai
	autocmd BufRead,BufNewFile *.txt setlocal filetype=txt
	autocmd BufRead,BufNewFile sh setlocal filetype = "sh"
	"autocmd FileType sh setlocal spell spelllang=en_us
"	autocmd FileType c setlocal spell spelllang=en_us
	autocmd FileType vim setlocal nu
	"autocmd FileType txt setlocal spell spelllang=en_us
	:autocmd FileType vim nnoremap <leader>c I"
augroup END
"c-w direction to switch between tabs of vim
"Ctrl-W, s will create a horizontal split.
"Ctrl-W, v will create a vertical split.
"Ctrl-W, direction will allow you to move among the panes.
":ls will show your open buffers.
":b <number> will open the specified buffer in the current pane.
":autocmd BufWritePre *.html :normal gg=G
"iabbrev <buffer> --- umas
"onoremap operator pending mappinf
":onoremap p i( and type dp will delete inside brackets
"something else type d in code and search for some word, will delete till the searched word
":onoremap b /return<cr>o
":zg to add a word in to spell dictionary
"The problem is that normal! doesn't recognize "special characters" like <cr>. 
":execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr> analyze   
" v_ vs $, $ will move to \n where as v_ moves to last nonblank character
set laststatus =2 
set ls =2 
":set statusline=%l    " Current line
":set statusline+=/    " Separator
":set statusline+=%L   " Total lines
"%f is name %y is file type %F is fullpath
" command | command2 are two seperate commands

:set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [%3l/%3L]
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor
"full path ---> echom expand('%:p')
"echom fnamemodify('foo.txt', ':p')
"echo globpath(".","*")
":echo split(globpath('.', '*'), '\n')
"recursive listing :echo split(globpath('.', '**'), '\n')
" :his is command hist, :his / is search q: is hist wndw or : c-f
"g/pattern/action and g! is inverse or v also can be used as inverse
" g/main/d will delete all lines matched and v or g! deletes other than matched line
":set nrformats=octal,hex,alpha
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"iab PP diag_printf (" __UMA__ %s %s %d\n",__FILE__,__func__,__LINE__);"
iab PP printf (" __UMA__ %s %s %d\n",__FILE__,__func__,__LINE__);
iab PO printf (" ");
map <F5> :call CurtineIncSw()<CR>
"let uname = system('uname -r')
let uname = substitute(system('uname -r'), '\n', '', '')
let oo = "/usr/src/linux-" . uname . "/tags"
"set tags=oo
"echom oo
set errorformat+=uma
set efm=uma
nnoremap ,* *<C-O>:%s///gn<cr>





""if has("autocmd")
""    augroup filetypedetect
""            au BufNewFile,BufRead *.myext    setf mysyntax
""    augroup END
""endif
""
""
""
""
"""nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
"""nnoremap <leader>l :call ToggleLocationList()<CR>
""
""" s: Find this C symbol
""nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
""" g: Find this definition
""nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
""" d: Find functions called by this function
""nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
""" c: Find functions calling this function
""nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
""" t: Find this text string
""nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
""" e: Find this egrep pattern
""nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
""" f: Find this file
""nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
""" i: Find files #including this file
""nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

cmap w!! w !sudo tee > /dev/null %

set shiftwidth=4
nmap <leader>( bi(<esc>ea)
nmap <leader>[ bi[<esc>ea]
nmap <leader>" bi"<esc>ea"
nmap <leader>h :find %:t:r.h<CR>

nnoremap -Q '<O#if 0<esc>'>o#endif<esc>
vnoremap -Q '<O#if 0<esc>'>o#endif<esc>
