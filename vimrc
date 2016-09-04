"=========================================================================================
"			                VIMRC CONFIGURATION FOR DEVELOPMENT NIEL
"
"=========================================================================================							
set secure                      " shell commands are not allowed and map commands are displayed
"=========================================================================================
"                           Project Specific Option
"=======================================================================================
"Indentation Rules for Project
"=======================================================================================
set tabstop=4                   "number of visual spaces per tab
set softtabstop=4               "number of spaces in tab when editing
set shiftwidth=4                "a tab is 4 spaces
set expandtab                   "To insert space characters whenever the tab key is pressed
set colorcolumn=110
set autoindent
set smartindent
set cindent
highlight ColorColumn ctermbg=darkgrey
syntax on
"===================================================================
"                             Global VIM Rules
"===================================================================
syntax enable                   " enable syntax processing
set number                      " show line number
set cursorline                  " highlight current line
filetype indent on              " load filetype specific indent file
set wildmenu                    " visual autocomplete for command menu
set showmatch                   " highlight matching parenthesis
set incsearch                   " search as characters are entered
set hlsearch                    " Highlight matches while searching
"----------encoding-----------
set encoding=utf-8
"===================================================================
"                             COPYING
"===================================================================
set clipboard=unnamed           " Copying from windows clipboard
"===================================================================
"                             Mouse
"===================================================================
set mouse=a                     " Enable mouse use in all modes, press ALT+CLICK on OSX
"set mouse=nicr
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
"===================================================================
"                  Background Color Option/Colorscheme
"===================================================================
"set background=dark
"colorscheme evening
"===================================================================
"set showcmd                     " display incomplete commands
""" Whitespace
"set nowrap                      " don't wrap lines
"set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
"set backspace=indent,eol,start  " backspace through everything in insert mode
"
""" Searching
"set ignorecase                  " searches are case insensitive...
"set smartcase                   " ... unless they contain at least one capital letter
"==========================================================================
"                   Remove Trailing Whitespace
"==========================================================================
function! <SID>StripTrailingWhitespaces()
"Preparation save last search, and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
" "Do the business:
  %s/\s\+$//e
" "Clean up: restore previous search history , and cursor position
  let @/=_s
  call cursor(l,c)
endfunction")
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
"=========================================================================
"                   WINDOW SPLITTING
"========================================================================
" Open new splits to the right and below of current splits
set splitbelow
set splitright
"Easier split window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
"=======================================================================
"                   Map Leader
"======================================================================
let mapleader=","
"======================================================================
"                   PLUGINS
"======================================================================
"                   Autoload Plugin
"======================================================================
"Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
"======================================================================
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=0
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F7> :tabn<CR>
nmap <F8> :tabp<CR>
"=====================================================================
"Ctrl+s and Ctrl+q to save and quit
"==================================
map <C-s> :w <CR> :echo "Saved" <CR>
imap <C-s> <Esc> :w <CR> :echo "Saved" <CR> i
nmap <C-Q> :q<CR>
" Allow us to use Ctrl-s and Ctrl-q as keybinds
" silent !stty -ixon
" Restore default behaviour when leaving Vim.
 autocmd VimLeave * silent !stty ixon
"=====================================================================
"                   Bundle Root
"=====================================================================
set runtimepath^=~/.vim/bundle/
set nocompatible
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
        let g:clang_library_path=s:clang_library_path
endif
