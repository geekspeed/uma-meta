fun! CommentAll()
let @a="I//"
exec ":g/__UMA__/normal! @a"
endfun

fun! UncommentAll()
let @b="Ildtp"
exec ":g/__UMA__/normal! @b"
endfun

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map ff :call ShowFuncName() <CR>

map -XC :call CommentAll() <CR>
map -XU :call UncommentAll() <CR>
