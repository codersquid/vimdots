" .vimrc
" cadged from David P Thomas, 02.10.2006 with additional changes by many
"
"------------------------------------------------------------------------------
" Environment
"------------------------------------------------------------------------------

" pathogen plugin management
" filetype needs to be off when loading pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" turn filetype detection back on
filetype plugin indent on


" height of command-line on bottom
set cmdheight=2

" don't behave like Vi
set nocompatible
" Minimal number of screen lines to keep above and below the cursor
set scrolloff=3
" Number of spaces to use for each step of (auto)indent
set shiftwidth=4
" Number of spaces that a <Tab> in the file counts for
set tabstop=4
" Show the line and column number of the cursor position
set ruler
" Title of the window will be set to the value of 'Vim - <filename>'
set title
" Don't wrap lines
set wrap
" characters to show before wrapped lines
set showbreak=<<>>
" Syntax highlighting
syntax on
" expand tabs to spaces
set expandtab
" turn off error bells
set noerrorbells
" set visual bells to have no beep or flash
set vb t_vb=
" show mode (Insert, Replace, Visual)
set showmode
" Characters to show in list mode
" set listchars=tab:»·,trail:·,eol:^,extends:>,precedes:<
set listchars=eol:^,extends:>,precedes:<
" set width of text line (max 80)
"set textwidth=80
" show line numbers
set number
" max number of undo levels
set undolevels=1000
" number of characters to be typed before swap file written to
set updatecount=100

" take some settings from Frank
autocmd FileType ant,xml,html,js,css,xsd set tabstop=2 " Spacing 2 in xml land
autocmd FileType ant,xml,html,js,css,xsd set shiftwidth=2

autocmd BufNewFile,BufRead *.bsh setf java
autocmd BufRead,BufNewFile *.proto setf proto
autocmd BufRead,BufNewFile *.st setf stringtemplate
autocmd BufRead,BufNewFile *.gradle setf groovy

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

set shellslash
set grepprg=grep\ -nH\ $*

"------------------------------------------------------------------------------
" Windows/Buffers
"------------------------------------------------------------------------------

set splitbelow
set splitright
set equalalways
set winheight=3
set winminheight=3

" set color of window title when moving to new window
autocmd WinEnter * hi StatusLine ctermbg=LightBlue ctermfg=White
autocmd WinEnter * hi StatusLineNC ctermbg=LightGray ctermfg=Black

"------------------------------------------------------------------------------
" Searching
"------------------------------------------------------------------------------

" show matched pattern incrementally
set incsearch
" highlight all matches of previous search pattern
set hlsearch
" Show matching brackets
set showmatch
" searches wrap around end of file
set wrapscan


"------------------------------------------------------------------------------
" Misc
"------------------------------------------------------------------------------

" in diff mode, scroll comparing windows at same time
if &diff
    set scrollbind
endif

set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line

let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

let NERDTreeShowHidden=1
let NERDTreeAutoCenter=1
nmap ,n :NERDTreeToggle<CR>

" import class under cursor
nmap ,i :JavaImport<cr>

let g:ctags_statusline=1
let g:ctags_title=1
let g:ctags_regenerate=0

set colorcolumn=79

highlight folded ctermfg=DarkGrey ctermbg=none cterm=underline term=none
highlight colorcolumn ctermbg=DarkBlue
