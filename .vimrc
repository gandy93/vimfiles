" === PATHOGEN SETTING ===
let g:pathogen_disabled = []

" Load Command-T only with Ruby support
if !has("ruby") && !executable("ruby")
    call add(g:pathogen_disabled, 'command-t')
endif

" Disable TagList and EasyTags if there is no ctags installed
if !executable("ctags")
    call add(g:pathogen_disabled, 'taglist')
    call add(g:pathogen_disabled, 'easytags')
endif

" Load Pathogen
call pathogen#infect()
call pathogen#helptags()
" === END OF PATHOGEN SETTING ===

" === MISC SETTING ===
" Setup UI
colorscheme blackboard
syntax on
set number

" Search settings
set hlsearch
set incsearch

" Enable buffer switching without saving
set hidden

" Make NERDTree show bookmarks by default
let NERDTreeShowBookmarks = 1

" Don't ask whether to save/load session
let g:session_autoload = "no"
let g:session_autosave = "no"

" Status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" === END OF MISC SETTING ===

" === WHITESPACES SETTING ===
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>\ ,eol:�

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

    autocmd BufReadPost fugitive://* set bufhidden=delete
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

" Refresh list of files in Command-t
if !pathogen#is_disabled("command-t")
    nnoremap <leader>f :CommandTFlush<CR>
endif

" Open Console2 in the current directory
function! s:openConsole(type)
    if !executable('Console')
        return 1
    endif

    let l:cmd   = 'Console -t ' . a:type . ' -d "' . expand('%:p:h') . '"'
    
    if !pathogen#is_disabled("shell")
        call xolox#shell#execute(l:cmd, 0)
    else
        system(l:cmd)
    endif
endfunction
nnoremap <leader>cw :call <SID>openConsole('Console2')<CR>
nnoremap <leader>cb :call <SID>openConsole('GitBash')<CR>

" Open/close NERDtree
nmap <leader>e :NERDTreeToggle<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>w :set list!<CR>
" === END OF KEYBOARD MAPPING ===
