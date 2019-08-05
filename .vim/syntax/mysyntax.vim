runtime! syntax/cpp.vim

syn keyword myConstant foo bar foobar quack
hi def link myConstant Constant
syn match myKeyWord "foobar" contained
hi kwRed  term=standout ctermfg=12 guifg=vimErrSetting
hi def link  myKeyWord  kwRed
