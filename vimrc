" Disable vi compatability
set nocompatible

" Pathogen
" To disable a plugin, add it's bundle name to the following list
"let g:pathogen_disabled = []
"filetype off
"call pathogen#infect()
"filetype plugin indent on
let mapleader = ","
let g:mapleader = ","

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

noremap <F2> ;NERDTreeToggle<CR>
noremap <F3> ;NumbersToggle<CR>
noremap <F4> ;NumbersOnOff<CR>
set pastetoggle=<F5>
nnoremap <F8> ;TagbarToggle<CR>



let mapleader = "<space>"
let g:mapleader = ","
let maplocalleader = ","


" Should I just use noremap here?
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

map <F2> ;NERDTreeToggle<CR>
map <F3> ;NumbersToggle<CR>
map <F4> ;NumbersOnOff<CR>
set pastetoggle=<F5>
nmap <F8> ;TagbarToggle<CR>

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'
Plug 'justinmk/vim-sneak'
Plug 'vim-syntastic/syntastic'
Plug 'hashivim/vim-terraform'
Plug 'kchmck/vim-coffee-script'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Fast saving
nnoremap <leader>w :w!<CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ev :e ~/.vimrc<CR>
nnoremap <silent> <leader>sv :so ~/.vimrc<CR>

set ofu=syntaxcomplete#Complete

" Jump straight to search results
set incsearch
set hlsearch

"clear search results
nnoremap <leader>/ :nohlsearch<cr>

" Background buffers without saving
set hidden

syntax on
set incsearch
set ignorecase
set smartcase
set autoindent

" set the terminals title
set title

set nu
set ic
set hls
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set sts=4

" highlight whitespace
set list  
set listchars=tab:>.,trail:.,extends:#,nbsp:.

autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType ruby setlocal shiftwidth=4 tabstop=4
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


"highlight SpellBad term=underline gui=undercurl guisp=Orange
set background=dark
"let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" increase the number of commands remembered by vim
set history=1000

" extend the types of pair matching vim does
runtime macros/matchit.vim

" Increase screen context around cursor
set scrolloff=7


" Wild menu (?)
set wildmenu

" read in files that are changed from the outside
set autoread

" ?
set backspace=eol,start,indent

" show matching brackets when cursor is over them
 set showmatch

 " Don't generate swapfiles because fuck swap files
 set noswapfile

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" dont skip over wrapped lines
nnoremap j gj
nnoremap k gk

" switch CWD to directory of current buffer
noremap <leader>cd :cd%:p:h<cr>:pwd<cr>

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

" Easymotion
" Switch easymotion key sequence back to the shorter version
" let g:EasyMotion_leader_key = '<Leader>'
" map <Leader> <Plug>(easymotion-prefix)
" nnoremap s <Plug>(easymotion-s2)
" nnoremap t <Plug>(easymotion-t2)
" let g:EasyMotion_smartcase = 1

" Syntastic
let g:syntastic_python_checkers=['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_css_checkers = ['prettycss']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_js_checkers = ['eslint']
let g:vue_disable_pre_processors=1


" NerdTree
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

" powerline
" set laststatus=2
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
let g:airline_powerline_fonts = 1

" terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1


" ctrlp config and searching
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
end

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
"
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bp :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
