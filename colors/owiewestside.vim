" Vim color file
" Maintainer:	Owen Stranathan <owenstranathan@gmail.com>
" Last Change:	2019 Aug 9
" Just trying to copy my weird terminal

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "owiewestside"

highlight Normal     guifg=#cccccc	guibg=#0c0c0c   gui=NONE
highlight Visual     			guibg=#767676	gui=NONE
highlight Comment    guifg=#61d6d6			gui=NONE
highlight Statement  guifg=#f9f1a5			gui=NONE
highlight LineNr     guifg=#f9f1a5			gui=NONE
highlight Type 	     guifg=#15c60d			gui=NONE
highlight Constant   guifg=#b4009e			gui=NONE
highlight Include    guifg=#3b78ff			gui=NONE
" To be continued
