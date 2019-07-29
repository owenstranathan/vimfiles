" set tabstop=2
" set shiftwidth=2
" set expandtab
set number
set nocompatible
set tags=tags
set path+=**
set mouse=a
set visualbell t_vb=
set guifont=IBM\ Plex\ Mono:h14
set guioptions -=m
set guioptions -=T
set encoding=utf-8
set backspace=indent,eol,start

if $TERM == "xterm" || $TERM == "screen"
	set t_Co=256
	set t_ut=
endif

syntax on

execute pathogen#infect()
colorscheme codedark

autocmd Filetype python setlocal tabstop=4
" autocmd vimenter * NERDTree
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

"
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap ,break :call Breakpoint() <CR>

" AIRLINE
let g:airline_theme = 'codedark'

" ALE
let g:ale_set_highlights = 1
let g:ale_python_pylint_change_directory = 0
let g:ale_python_pyline_auto_pipenv = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'python': ['black'],
\}
let g:ale_set_highlights = 1

" NERDTree
let NERDTreeShowHidden=1

" let pipenv_venv_path = system('pipenv --venv')
" if shell_error == 0
"   let g:env_python_binary_path = substitute(pipenv_venv_path, '\n', '', '') . '/bin/python'
" else
"   let g:env_python_binary_path = system('which python3.7')
" endif
" 
" let g:completor_python_binary = g:env_python_binary_path
let g:vimfiles_dir = ""
if has("win32") || has("win64")
	let g:vimfiles_dir = $VIM . "/vimfiles"
else
	let g:vimfiles_dir="~/.vim"
endif
let g:ycm_global_ycm_extra_conf = g:vimfiles_dir . "/.ycm_extra_conf.py"
set runtimepath^="&g:vimfiles_dir/ctrlp.vim"

nnoremap <F4> :make!<cr>
nnoremap <F5> :!make run<cr>
nnoremap <F6> :!make both<cr>
