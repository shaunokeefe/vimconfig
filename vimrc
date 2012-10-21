" Pathogen
filetype off
call pathogen#infect()
filetype plugin indent on

filetype plugin on
set ofu=syntaxcomplete#Complete

" Disable vi compatability
set nocompatible

set incsearch

syntax on
set incsearch
set autoindent
set nu
set ic
set hls
set ts=4
set sw=4
set smarttab
set expandtab
set sts=4
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
nnoremap ; :
nnoremap : ; 
vnoremap ; :
vnoremap : ;

if has("gui_running")
    colorscheme inkpot
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

map <F2> ;NERDTreeToggle<CR>
nmap <F8> ;TagbarToggle<CR>
