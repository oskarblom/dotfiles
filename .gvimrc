" Should be first
set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Indentation
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
filetype on
filetype indent plugin on

" Looks
let g:molokai_original=1
colorscheme molokai
syntax on
set cursorline
set nowrap
set number
set ruler
set scrolloff=7
set colorcolumn=81

" GUI specific
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 10
        set columns=100
        set lines=30
    elseif has("gui_macvim")
        set guioptions=egmrt
        set guifont=Monaco:h14
        set columns=130
        set lines=35
        noremap <D-1> 1gt
        noremap <D-2> 2gt
        noremap <D-3> 3gt
        noremap <D-4> 4gt
        noremap <D-5> 5gt
        noremap <D-6> 6gt
        noremap <D-7> 7gt
        noremap <D-8> 8gt
        noremap <D-9> 9gt
        noremap <D-S-right> gt
        noremap <D-S-left> gT
    else
        " Win
        set columns=140
        set lines=46
        set guifont=Consolas:h14
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        :cd c:\Users\oskar.blom
    endif
    " Autocommand
    if has("autocmd")
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType python set makeprg=pychecker\ %
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        autocmd FileType c set omnifunc=ccomplete#Complete
        autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
        autocmd GUIEnter * set visualbell t_vb=
    endif
    " Disable sound and bell
    set vb t_vb=
else
    " Disable sound and bell
    set noeb vb t_vb=
endif

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" Nerdtree
"let NERDTreeDirArrows=1
"let NERDTreeMinimalUI=1

" Tlist
let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Inc_Winwidth = 0

" Mappings
let mapleader = ","
nnoremap <F8> :set list! <CR>
map <F7> :TlistToggle<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
map <leader>t <C-]>
map <leader>l g]
nnoremap <tab> :bNext <CR>
nnoremap <S-tab> :bprevious <CR>

set listchars=tab:⇒\ ,eol:↵

" Misc
set encoding=utf-8
set hidden
set title
let python_highlight_all=1
set shortmess+=I
set omnifunc=syntaxcomplete#Complete
set wildmenu
set showcmd
set backspace=indent,eol,start
set ttyfast
set ssop-=options "Don't store setting values in the session
