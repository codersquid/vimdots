" .vimrc
" cadged from David P Thomas, 02.10.2006 with additional changes by many
"------------------------------------------------------------------------------
"
" Vim Scripts
" -----------
" ack
" bufexplorer
" ctags
" fugitive
" nerdcommenter
" nerdtree
" proto
" pyflakes-vim
" snipmate
" stringtemplate
" taglist
" solarized
" mediawiki
" markdown
"------------------------------------------------------------------------------

" pathogen plugin management
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
" turn filetype detection back on
filetype plugin indent on

" solarized terminal colors option
set t_Co=16

set cmdheight=2
set nocompatible
" Minimal number of screen lines to keep above and below the cursor
set scrolloff=3
set shiftwidth=4
set tabstop=4
" Show the line and column number of the cursor position
set ruler
set title
" Don't wrap lines
set wrap
" characters to show before wrapped lines
set showbreak=<<>>
syntax on
set expandtab
set noerrorbells
" set visual bells to have no beep or flash
set vb t_vb=
set showmode
" Characters to show in list mode
" set listchars=tab:��,trail:�,eol:^,extends:>,precedes:<
set listchars=eol:^,extends:>,precedes:<
" set width of text line (max 80)
"set textwidth=80
set number
set undolevels=1000
" number of characters to be typed before swap file written to
set updatecount=100

autocmd FileType ant,xml,html,js,css,xsd set tabstop=2
autocmd FileType ant,xml,html,js,css,xsd set shiftwidth=2

autocmd BufNewFile,BufRead *.bsh setf java
autocmd BufRead,BufNewFile *.proto setf proto
autocmd BufRead,BufNewFile *.st setf stringtemplate
autocmd BufRead,BufNewFile *.gradle setf groovy
autocmd BufRead,BufNewFile *.mw setf mediawiki
autocmd BufRead,BufNewFile *.mediawiki setf mediawiki
" Alternatively, the command :setf mediawiki
" will temporarily set the syntax for the current file.
" this is the only way I know how to have mediawiki
" mode when using the firefox It's all text plugin.

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

set incsearch
" highlight all matches of previous search pattern
set hlsearch
" Show matching brackets
set showmatch
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

let Tlist_Show_One_File=1
let Tlist_Use_SingleClick=1

let g:notes_directory = '~/notetoself'
let g:notes_suffix = '.txt'

" I bet this will get annoying but I'm playing around with it
"set colorcolumn=79,120

highlight folded ctermfg=DarkGrey ctermbg=none cterm=underline term=none
highlight colorcolumn ctermbg=DarkBlue

" solarized dark
"set background=dark
"colorscheme solarized

" solarized light
"set background=light
"colorscheme solarized

