" Indentation
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
filetype indent plugin on

" Looks
colorscheme molokai
set background=dark
syntax on
set cursorline
set nowrap
set number
set ruler
set scrolloff=7

" GUI specific
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 10
        set columns=100
    elseif has("gui_macvim")
        set guioptions=egmrt
        set guifont=Monaco:h14
        set columns=130
    endif
    set lines=30
    " Autocommand
    if has("autocmd")
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType python set makeprg=python\ %
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    endif
    set vb t_vb=
else
    set noeb vb t_vb=
endif

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" Nerdtree
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1

" Mappings
let mapleader = ","
map <F9> :NERDTreeToggle<CR>
nnoremap <F8> :set list! <CR>
map <F7> :TMiniBufExplorer<CR>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <leader>9 <C-]>
nnoremap <tab> :bNext <CR>
nnoremap <s-tab> :bPrevious <CR>

" Whitespace
set listchars=tab:▸\ ,eol:¬

" Misc
set encoding=utf-8
set nocompatible
set hidden
set title
"set visualbell
set shortmess+=I
let python_highlight_all=1
