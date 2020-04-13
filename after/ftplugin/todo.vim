set shiftwidth=2
set tabstop=2
set noexpandtab

if exists("b:current_syntax")
    finish
endif


syn match TodoTag /\#\S\+/
syn match TodoDate /^\t*@\t.*/
syn region TodoUnstartedTask start=/\[\t/ end=/$/ contains=TodoTag,TodoDate keepend
syn region TodoStartedTask start=/\/\t/ end=/$/ contains=TodoTag,TodoDate keepend
syn region TodoCompletedTask start=/x\t/ end=/$/ contains=TodoTag,TodoDate keepend
syn region TodoMigratedTask start=/>\t/ end=/$/ contains=TodoTag,TodoDat keepend
syn region TodoStrikethrough start=/\~\t/ end=/$/ contains=TodoTag,TodoDate keepend
syn region TodoNote start=/-\t/ end=/$/ contains=TodoTag,TodoDate keepend

let b:current_syntax = "todo"
