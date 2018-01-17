" vim: fdm=marker

" Vim settings {{{
" Setup colorscheme
" set t_ti= t_te= " do not clear screen on exit
set t_Co=256 " Force 256 colors
colorscheme xoria256-my

set nocompatible	" Use Vim defaults instead of 100% vi compatibility 
filetype off                  " required
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

set backspace=indent,eol,start	" more powerful backspacing
" set linebreak		" Don't wrap words by default
" set textwidth=0		" Don't wrap lines by default 
set backupcopy=yes	" Keep a backup file
set backupdir=~/.vim/backup

set undofile		" Persistent undo
set undodir=~/.vim/undo

set viminfo='20,\"50	" read/write file .viminfo, store<=50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set number			" Show line numbers
set laststatus=2	" Always show the statusline
set colorcolumn=0
"set cursorline      " Highlight current line

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set showcmd		" Show (partial) command in status line.
set showmatch	" Show matching brackets.
set ignorecase	" Do case insensitive matching
set incsearch	" Incremental search

set wildignore=*/.git/*,*/.svn/*
set wildignore+=*.o,*.so,*.pyc
set wildmode=longest:full
set wildmenu

set autoindent		" always set autoindenting on
set noexpandtab
set smarttab
set shiftwidth=4
set tabstop=4
set hlsearch	" Highlight search
set nowrapscan	" Don't wrap around EOF or BOF while searching
set suffixesadd=.pl,.pm,.yml,.yaml,.tyaml " for `gf' (open file under cursor)

set list
set listchars=tab:→\ ,trail:·

set nofoldenable

" Filetypes {{{

" au BufRead,BufNewFile job* set filetype=mrproc
au BufRead,BufNewFile *.py set expandtab shiftwidth=4
au BufRead,BufNewFile *.page set filetype=pandoc
au BufRead,BufNewFile *.html set filetype=htmldjango expandtab shiftwidth=2
au BufRead,BufNewFile *.{c,cpp,cxx,h,hpp,hxx} set filetype=google.cpp

" Do not annoy while typing '\'
"au BufRead,BufNewFile *.pl,*.pm let maplocalleader="`"
" }}} Filetypes


" Vundle {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" show current branch in airline
Plugin 'tpope/vim-fugitive'

" nice python syntax highlighting
Plugin 'achimnol/python-syntax'

" Allow easy rst editing
Bundle 'Rykka/riv.vim'


call vundle#end()            " required
filetype plugin indent on    " required

" }}} Vundle


" Plugin options {{{

let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_pylint_args = "--disable C0111,C0330,E501,R0201 -j 4"
let g:syntastic_python_flake8_args = "--max-line-length 99 --max-complexity 15"
let g:syntastic_aggregate_errors = 1

""" airline settings
" show statusline all the time
set laststatus=2
let g:airline_theme = 'luna'
let g:airline_extensions = ['branch', 'tabline']

" }}} Plugin options

nmap <leader>c :nohl<CR>:SyntasticReset<CR>
nmap <leader>g :YcmCompleter GoToDefinition<CR>
