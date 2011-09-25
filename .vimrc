call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Setup UI
colorscheme blackboard
filetype on
syntax on
set notimeout

" === WHITESPACES SETTING ===
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:¸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" === END OF WHITESPACES SETTING ===
