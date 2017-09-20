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
" editorconfig-vim
" markdown
" mediawiki
" nerdcommenter
" nerdtree
" proto
" snipmate
" solarized
" stringtemplate
" syntastic
" taglist
" vim-ansible-yaml
" vim-flake8
" vim-go
" vim-isort
" vim-python-pep8-indent
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
" set listchars=tab:»·,trail:·,eol:^,extends:>,precedes:<
set listchars=eol:^,extends:>,precedes:<
" set width of text line (max 80)
"set textwidth=80
set number
set undolevels=1000
" number of characters to be typed before swap file written to
set updatecount=100

autocmd FileType ant,xml,html,js,css,xsd,tex,yaml set tabstop=2
autocmd FileType ant,xml,html,js,css,xsd,tex,yaml set shiftwidth=2

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

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev ag Ack!
nmap ,a :ag<Space>



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

" vim-go
let g:go_fmt_command = "goimports"
au FileType go nmap ,r <Plug>(go-run)
au FileType go nmap ,b <Plug>(go-build)
au FileType go nmap ,i <Plug>(go-install)
au FileType go nmap ,gt <Plug>(go-test)
au FileType go nmap ,ds <Plug>(go-def-split)

let g:ctags_statusline=1
let g:ctags_title=1
let g:ctags_regenerate=0

nmap ,t :TagbarToggle<cr>

nmap ,p8 :call Flake8()<cr>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:neocomplete#enable_at_startup = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args='--ignore=E225,E401,E501'

let g:notes_directory = '~/.notes'
let g:notes_suffix = '.txt'

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" I bet this will get annoying but I'm playing around with it
set colorcolumn=80,120

highlight folded ctermfg=DarkGrey ctermbg=none cterm=underline term=none
highlight colorcolumn ctermbg=DarkBlue

" solarized dark
"set background=dark
"colorscheme solarized

" solarized light
"set background=light
"colorscheme solarized
