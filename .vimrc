call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Setup UI
colorscheme blackboard
syntax on
set notimeout
set number

" Search settings
set hlsearch
set incsearch

" Enable buffer switching without saving
set hidden

" === WHITESPACES SETTING ===
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:¸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Default
set autoindent
set ts=4 sts=4 sw=4 expandtab

if has("autocmd")
    filetype on

    autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType text setlocal ts=6 sts=6 sw=6 noexpandtab
endif
" === END OF WHITESPACES SETTING ===

" === KEYBOARD MAPPING ===
" Start ex command with spacebar
nmap <space> :
vmap <space> :
" === END OF KEYBOARD MAPPING ===
