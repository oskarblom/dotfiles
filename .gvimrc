" Should be first
set nocompatible

" Pathogen
call pathogen#infect()
"call pathogen#helptags()

" Indentation
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
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
set laststatus=2   " Always show the statusline
set fillchars=vert:‖

" GUI specific
if has("gui_running")
    " Linux
    if has("gui_gtk2")
        set guifont=Monospace\ 10
        set columns=100
        set lines=30
    " Windows
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
        set lines=36
        set guifont=Consolas:h13
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
    endif
    set t_Co=256

    " Disable sound and bell
    set vb t_vb=
else
    let s:term = $TERM
    if $TERM == "xterm-256color"
        set t_Co=256
    else
        set t_Co=8
    endif
    " Disable sound and bell
    set noeb vb t_vb=
endif


"Autocommands

if has("autocmd")
    autocmd FileType python set makeprg="pylint\ --reports=n\ --output-format=parseable\ %:p"
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python set errorformat="%f:%l:\ %m"
    autocmd FileType python let s:commentprefix = '#'

    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript let s:commentprefix = '//'

    autocmd FileType vim let s:commentprefix = '"'

    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html let s:commentprefix = '<!--'
    autocmd FileType html let s:commentsuffix = '-->'

    autocmd FileType css set omnifunc=csscomplete#CompleteCSS

    autocmd FileType c set omnifunc=ccomplete#Complete

    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

    autocmd FileType snippet setlocal noexpandtab
    autocmd FileType snippet setlocal softtabstop=8

    autocmd GUIEnter * set visualbell t_vb=
endif

" OS

if has("mac") || has("unix")
    set backupdir=~/.vim/.backup
    set directory=~/.vim/.swap
elseif has("win32") || has("win64")
    cd ~
    set backupdir=~/vimfiles/_backup
    set directory=~/vimfiles/_swap
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
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$']
map <F10> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" Tlist

let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Inc_Winwidth = 0

" Mappings

set timeoutlen=5000
let mapleader = ","
map <F7> :TlistToggle<CR>
"Window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" For finding tag stuff
nnoremap <leader>to <C-]>
nnoremap <leader>tl g]
nnoremap Y y$
nnoremap D d$
noremap H ^
noremap L $
" Just highlight the word. Don't find next 'till I say so.
nnoremap * *<C-o>
vmap <leader>c :CommentReg<CR>
vmap <leader>u :UnCommentReg<CR>
" PCRE
noremap / /\v
" Sudo trick
cnoremap w!! %!sudo tee > /dev/null %

" Abbreviations

"Open the quickfix window on top like everything else.
:cnoreabbrev copen topleft copen

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
set noesckeys
set autoread
set relativenumber


function GetSelection()
    let l:cursorpos = getpos(".")
    let l:startpos = getpos("v")
    let l:endpos = getpos("'>")
endfunction

" Comment region
command! -nargs=* -range CommentReg call CommentRegion(<line1>, <line2>)
command! -nargs=* -range UnCommentReg call UnCommentRegion(<line1>, <line2>)


" Paren matching

let s:parenmap = {'(': ')', '[': ']', '{': '}'}

"for p in keys(s:parenmap)
"    exec("inoremap " . p . " \<c-r>=Parenmatch('" . p . "')\<cr>")
"endfor

function Parenmatch(paren)
    if !has_key(s:parenmap, a:paren)
	return a:paren
    endif
    let l:currpos = getpos(".")
    :normal %
    let l:matchpos = getpos(".")
    if l:currpos[1] == l:matchpos[1] && l:currpos[2] == l:matchpos[2] 
	return a:paren
    endif
    call setpos(".", l:currpos)
    return a:paren . s:parenmap[a:paren] . "\<left>"
endfunction

"TODO: fix escape

function! CommentType()
    if !exists("s:commentprefix") || s:commentprefix == ""
        echoerr "Comment prefix not set or empty for current filetype"
        return ""
    endif
    if !exists("s:commentsuffix") || s:commentsuffix == ""
        return "prefix"
    else
        return "surround"
    endif
endfunction

function! CommentRegion(l1, l2)
    let l:commenttype = CommentType()
    if l:commenttype == ""
        return
    elseif l:commenttype == "prefix"
        exec a:l1 . "," . a:l2 . 's/^/' . escape(s:commentprefix, '/"')
    elseif l:commenttype == "surround"
        exec "normal! :" . a:l2 . "\<cr>o" . s:commentsuffix . "\<esc>:" . a:l1 . "\<cr>O" . s:commentprefix
    endif
endfunction

function! UnCommentRegion(l1, l2)
    let l:commenttype = CommentType()
    if l:commenttype == ""
        return
    elseif l:commenttype == "prefix"
        exec a:l1 . "," . a:l2 's/^' . escape(s:commentprefix, '/"') . '//'
    elseif l:commenttype == "surround"
        exec "normal! :" . a:l2 . "\<cr>:s/\s*" . s:commentsuffix . "//\<cr>" . ":" . a:l1 . "\<cr>:s/\s*" . s:commentprefix . "//\<cr>"
    endif
endfunction

" Change the current tabwidth
command! -nargs=* Settab call Stab()
function! Stab()
    let l:tabstop = 1 * input("set softtabstop = shiftwidth = ")
    if l:tabstop > 1
        let &l:sts = l:tabstop
        let &l:sw = l:tabstop
    endif
endfunction

" Add a custom snippet for the current filetype
command! -nargs=* AddSnippet call ASnippet()
function! ASnippet()
    let l:currft = &ft
    if l:currft != ""
        let l:snippath = $HOME . '/.vim/snippets/' . l:currft . '.snippets'
"        exec "!file " . l:snippath
"        let l:filecode = substitute(system("silent !echo $?"), "\n", "")
"        echom l:filecode
        exec ":e " . l:snippath
        :normal G
    else
        echoerr "No filetype associated with current file"
    endif
endfunction

":%s/^\s*/&&/g
"Use map-operator for custom command with motions

