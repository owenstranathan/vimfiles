set shiftwidth=2
set tabstop=2
set noexpandtab

if exists("b:current_syntax")
    finish
endif


syn match TodoTag /\#\S\+/
syn match TodoUnstartedTask /^\t*\[\t.*/
syn match TodoStartedTask /^\t*\/\t.*/
syn match TodoCompletedTask /^\t*x\t.*/
syn match TodoMigratedTask /^\t*>\t.*/
syn match TodoStrikethrough /^\t*\~\t.*/
syn match TodoDate /^\t*@\t.*/
syn match TodoNote /^\t*-\t.*/

let b:current_syntax = "potion"
