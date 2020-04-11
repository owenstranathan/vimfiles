set shiftwidth=4
set tabstop=4
set noexpandtab

syn keyword	cTodo		contained TODO FIXME OPTMZ NOTE XXX
if has("win32") || has("win64")
	set path+=C:\\Users\\Public\\Libraries\\SFML-2.5.1\\include\\
	" set path+="src/include,/usr/include/AL,"
endif

