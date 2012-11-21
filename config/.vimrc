"
" adamhadani's vimrc
"

" Pathogen settings
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" The following are typically already set e.g for linux distros,
" however is useful to set explicitly for OSX (Tested on Lion - 10.7.x)
set ai
set history=100
set ruler
syntax on
set hlsearch
filetype plugin on

" Python Code - Expand tabs to spaces
autocmd FileType * set tabstop=4|set shiftwidth=4
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType *.yaml set tabstop=4|set shiftwidth=4|set expandtab


" No annoying tilde backups
set nobk

" Paste behavior
set paste
set pastetoggle=<F2>

" disable arrow keys - GURU MODE
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

