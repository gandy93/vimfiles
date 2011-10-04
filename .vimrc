" === PATHOGEN SETTING ===
let g:pathogen_disabled = []

" Load Command-T only in GVim with Ruby support
if !has("gui_running") && has("ruby")
    call add(g:pathogen_disabled, 'command-t')
endif

" Disable TagList and EasyTags if there is no ctags installed
if !executable("ctags")
    call add(g:pathogen_disabled, 'taglist')
    call add(g:pathogen_disabled, 'easytags')
endif

" Load Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" === END OF PATHOGEN SETTING ===

" Setup UI
colorscheme blackboard
syntax on
set number

" Search settings
set hlsearch
set incsearch

" Enable buffer switching without saving
set hidden

" === WHITESPACES SETTING ===
 
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
" Setup leader key
let mapleader = ","
set notimeout

" Start ex command with spacebar
nmap <space> :
vmap <space> :

" Local CD to current's file directory.
nmap <leader>ccd :lcd %:p:h<CR>

" Toggle TagList
if !pathogen#is_disabled("taglist")
    nmap <leader>l :TlistToggle<CR>
endif

" Open/close NERDtree
nmap <leader>e :NERDTreeToggle<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>w :set list!<CR>
" === END OF KEYBOARD MAPPING ===
