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

colorscheme owiewestside

if $TERM == "xterm" || $TERM == "screen" || $TERM == "xterm-256color"
	set t_Co=256
	set t_ut=
"elseif $TERM == "cygwin"
	"set t_Co=16
endif

syntax on

execute pathogen#infect()

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

" NERDTree
if has("macunix")
	nnoremap « :NERDTree .<CR>
else
	nnoremap <M-\> :NERDTree .<CR>
endif
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap ,break :call Breakpoint() <CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$'] " vim is almost perfect, but for .swp files

" ALE
" let g:ale_set_highlights = 1
let g:ale_enabled=0 " ALE fucks with YCM on windows gvim (dunno why)

" YouCompleteMe
let g:vimfiles_dir = ""
if has("win32") || has("win64")
	let g:vimfiles_dir = $VIM . "/vimfiles"
else
	let g:vimfiles_dir="~/.vim"
endif
let g:ycm_global_ycm_extra_conf = g:vimfiles_dir . "/.ycm_extra_conf.py"
" let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_log_level = 'debug'

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

filetype plugin on " I don't know why this is here but I remember putting it here and I'm scared to delete

" whitespace
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

" Calendar (if I have it)
let g:calendar_google_calendar=1

" Todo
let g:todo_directory="D:\code\owenstranathan\todo"

nnoremap Q <Nop>
