" Should be first
set nocompatible 
" Pathogen 
call pathogen#infect() 
" Do this manually when installing a new plugin instead "call pathogen#helptags() 
" Indentation 
set tabstop=8 
set softtabstop=4 
set shiftwidth=4 
set expandtab 
set autoindent 
filetype indent plugin on 
" Looks 
"let g:molokai_original=1 
syntax on
set cursorline
set nowrap
set number
set ruler
set scrolloff=7
if exists("&colorcolumn")
    set colorcolumn=80
endif
" Always show the statusline
set laststatus=2

" GUI specific
if has("gui_running")
    " Linux
    if has("gui_gtk2")
        colorscheme molokai
        set guifont=Monospace\ 10
        set columns=100
        set lines=30
    " Windows
    elseif has("gui_macvim")
        colorscheme molokai
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
        colorscheme solarized
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
    if $TERM == "xterm" || $TERM == "xterm-256color" || $TERM == "screen"
        set t_Co=256
    else
	colorscheme default
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
    autocmd FileType python let b:commentprefix = '#'

    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript let b:commentprefix = '//'

    autocmd FileType vim let b:commentprefix = '"'

    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html let b:commentprefix = '<!--'
    autocmd FileType html let b:commentsuffix = '-->'

    autocmd FileType css set omnifunc=csscomplete#CompleteCSS

    autocmd FileType c set omnifunc=ccomplete#Complete

    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

    autocmd FileType snippet setlocal noexpandtab
    autocmd FileType snippet setlocal softtabstop=8

    autocmd GUIEnter * set visualbell t_vb=
endif

" OS

if has("mac") || has("unix")
    " This won't fly on windows
    set fillchars=vert:‖
    set listchars=tab:⇒\ ,eol:↵
elseif has("win32") || has("win64")
    cd ~
endif

set nobackup
set noswapfile


" Search

set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

let mapleader = ","

" Syntastic
let g:syntastic_mode_map = { "mode": "passive" }
nnoremap <leader>s :SyntasticCheck<CR>

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
map <F7> :TlistToggle<CR>
"Window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" For finding tag stuff
nnoremap <leader>to <C-]>
nnoremap <leader>tl g]
nnoremap <leader>: :silent 
"
inoremap {<cr> {<cr>}<esc>O
vmap <leader>c :CommentReg<CR>
vmap <leader>u :UnCommentReg<CR>
" Sudo trick
cnoremap w!! %!sudo tee > /dev/null %

" Abbreviations

"Open the quickfix window on top like everything else.
:cnoreabbrev copen topleft copen

" Misc
set encoding=utf-8
set hidden
set title
let python_highlight_all=1
set shortmess+=I
set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildmode=list:longest,full
set showcmd
set backspace=indent,eol,start
set ttyfast
set ssop-=options "Don't store setting values in the session
set noesckeys
set autoread

function! GetSelection()
    let l:cursorpos = getpos(".")
    let l:startpos = getpos("v")
    let l:endpos = getpos("'>")
endfunction

command! -nargs=* -range Json exec "<line1>,<line2>!python -mjson.tool"

" Comment region
command! -nargs=* -range CommentReg call CommentRegion(<line1>, <line2>)
command! -nargs=* -range UnCommentReg call UnCommentRegion(<line1>, <line2>)

command! -nargs=* Scratch call ScratchBuffer()

function! ScratchBuffer()
    let l:hasbuf = bufexists("[Scratch]")
    if l:hasbuf == 0
        :e [Scratch] | setlocal buftype=nofile
    else
        :buffer \[Scratch]
    endif
endfunction

" Paren matching

"let s:parenmap = {'(': ')', '[': ']', '{': '}'}

"for p in keys(s:parenmap)
"    exec("inoremap " . p . " \<c-r>=Parenmatch('" . p . "')\<cr>")
"endfor

function! Parenmatch(paren)
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
    if !exists("b:commentprefix") || b:commentprefix == ""
        echoerr "Comment prefix not set or empty for current filetype"
        return ""
    endif
    if !exists("b:commentsuffix") || b:commentsuffix == ""
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
        exec a:l1 . "," . a:l2 . 's/^/' . escape(b:commentprefix, '/"')
    elseif l:commenttype == "surround"
        exec "normal! :" . a:l2 . "\<cr>o" . b:commentsuffix . "\<esc>:" . a:l1 . "\<cr>O" . b:commentprefix
    endif
endfunction

function! UnCommentRegion(l1, l2)
    let l:commenttype = CommentType()
    if l:commenttype == ""
        return
    elseif l:commenttype == "prefix"
        exec a:l1 . "," . a:l2 's/^' . escape(b:commentprefix, '/"') . '//'
    elseif l:commenttype == "surround"
        exec "normal! :" . a:l2 . "\<cr>:s/\\s*" . b:commentsuffix . "\\n//\<cr>" . ":" . a:l1 . "\<cr>:s/\\s*" . b:commentprefix . "\\n//\<cr>"
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

"" Add a custom snippet for the current filetype
"command! -nargs=* AddSnippet call ASnippet()
"function! ASnippet()
"    let l:currft = &ft
"    if l:currft != ""
"        let l:snippath = $HOME . '/.vim/snippets/' . l:currft . '.snippets'
""        exec "!file " . l:snippath
""        let l:filecode = substitute(system("silent !echo $?"), "\n", "")
""        echom l:filecode
"        exec ":e " . l:snippath
"        :normal G
"    else
"        echoerr "No filetype associated with current file"
"    endif
"endfunction

function! Debug() range
    echo a:firstline
endfunction


":%s/^\s*/&&/g
"Use map-operator for custom command with motions
"set wildignore=*/
