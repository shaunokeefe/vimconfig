" Pathogen

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

filetype off
call pathogen#infect()
filetype plugin indent on

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"filetype plugin on
set ofu=syntaxcomplete#Complete

" Disable vi compatability
set nocompatible

" Jump straight to search results
set incsearch

set hlsearch

" Background buffers without saving
set hidden

syntax on
set incsearch
set ignorecase
set smartcase
set autoindent

" ?
set title

set nu
set ic
set hls
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set sts=4
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


"highlight SpellBad term=underline gui=undercurl guisp=Orange
colorscheme koehler

if has("gui_running")
    "colorscheme koehler
    "highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

map <F2> ;NERDTreeToggle<CR>
map <F3> ;NumbersToggle<CR>
map <F4> ;NumbersOnOff<CR>
set pastetoggle=<F5>
nmap <F8> ;TagbarToggle<CR>

" increase the number of commands remembered by vim
set history=1000

" extend the types of pair matching vim does
runtime macros/matchit.vim

" Increas screen context around cursor
set scrolloff=7


" Wild menu (?)
set wildmenu

" read in files that are changed from the outside
set autoread

set backspace=eol,start,indent

" show matching brackets when cursor is over them
 set showmatch

 " Don't generate swapfiles because fuck swap files
 set noswapfile

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" switch CWD to directory of current buffer
map <leader>cd :cd%:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

set laststatus=1
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
    %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Switch easymotion key sequence back to the shorter version
let g:EasyMotion_leader_key = '<Leader>'

let g:syntastic_python_checkers=['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5


" NerdTree
let NERDTreeIgnore = ['\.pyc$']

