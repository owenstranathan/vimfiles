set number
set nocompatible
set tags=tags
set mouse=a
set visualbell t_vb=
set encoding=utf-8
set backspace=indent,eol,start
set exrc
set secure
set splitright  " yeah!
set laststatus=2
if has("win32") || has("win64")
	let g:vimfiles_dir = $VIM . "/vimfiles"
else
	let g:vimfiles_dir="~/.vim"
endif
set runtimepath^="&g:vimfiles_dir"

colorscheme owiewestside

if $TERM == "xterm" || $TERM == "screen" || $TERM == "xterm-256color"
	set t_Co=256
	set t_ut=
"elseif $TERM == "cygwin"
	"set t_Co=16
endif

syntax on

autocmd Filetype python setlocal tabstop=4
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let s:breakpoints = {
\  "python": "import pdb; pdb.set_trace"
\}

function! g:Breakpoint()
	if has_key(s:breakpoints, &filetype)
		let filename = "$HOME/.vim/snippets/" . &filetype . "/breakpoint"
		execute "-1read " . filename
	endif
endfunction


" ALE
" let g:ale_set_highlights = 1
let g:ale_enabled=0 " ALE fucks with YCM on windows gvim (dunno why)

" CtrlP
set runtimepath^="&g:vimfiles_dir/ctrlp.vim"
let g:ctrp_map='<c-p>'
let g:ctrlp_cmd='CtrlPMixed'

" Lightline
let g:lightline = {
	\'colorscheme': 'default',
	\}

" make things
nnoremap <F4> :make!<cr>
nnoremap <F5> :!make run<cr>
nnoremap <F6> :!make both<cr>

" causes files in ~/.vim/ftplugin to be loaded
filetype plugin on

" F2 toggles showing EOL with '$'
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

" Calendar (if I have it)
let g:calendar_google_calendar=1

" Turns off Ex-mode shortcut. You can still use gQ to get to Ex-mode
nnoremap Q <Nop>

" see :help ft-make-syntax
let g:make_no_commands=1

" Todo
let g:todo_path = "$HOME/todo.todo"
command Todo :call OpenTodo(g:todo_path)
" type Td to open todo file given by g:todo_path
nnoremap <S-t>d :Todo<cr>
function! OpenTodo(path)
	if bufexists(a:path)
		execute ":b " . bufnr(a:path)
	else
		execute ":e " . a:path
	endif
endfunction


" Notes
let g:notes_path = "$HOME/notes.txt"
command Notes :call OpenNotes(g:notes_path)
" type Td to open todo file given by g:todo_path
nnoremap <S-n>t :Notes<cr>
function! OpenNotes(path)
	if bufexists(a:path)
		execute ":b " . bufnr(a:path)
	else
		execute ":e " . a:path
	endif
endfunction

" Scratch
let g:scratch_path = "$HOME/scratch.txt"
command Scratch :call OpenScratch(g:scratch_path)
"type Sc to open scratch file given by g:scratch_path
nnoremap <S-s>c :Scratch<cr>
function! OpenScratch(path)
	if bufexists(a:path)
		execute ":b " . bufnr(a:path)
	else
		execute ":e " . a:path
	endif
endfunction

" netrw
let g:netrw_list_hide= '.*\.swp$'

" CoC stuff
"
" Use tab to trigger coc completion
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

