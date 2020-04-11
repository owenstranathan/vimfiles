set shiftwidth=2
set tabstop=2
set noexpandtab

syn match TodoTag /\#\S\+/
syn match TodoUnstartedTask /^\t*\[\t/
syn match TodoStartedTask /^\t*\/\t/
syn match TodoCompletedTask /^\t*x\t/
syn match TodoStrikethrough /^\t*\~\t/
syn match TodoDate /^\t*@\t/
syn match TodoNote /^\t*-\t/
syn match TodoMigrated /^\t*>\t/
