if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

endif

if has('syntax') && has('eval')
  packadd! matchit
endif

augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

augroup END

" MY CONFIGURATION

" Functions and commands

function! Openterm()
    " Opens a terminal
    belowright term zsh
    resize -8
endfunc

function! ToggleTrailingWhiteSpaces()
    highlight ShowTrailingWhitespace ctermbg=Red guibg=Red
    if ShowTrailingWhitespace#IsSet()
        echo "Whitespaces turned off"
        call ShowTrailingWhitespace#Set(0, 0)
    else
        echo "Whitespaces turned on"
        call ShowTrailingWhitespace#Set(1, 0)
    endif
endfunc

" Copy to clipboard the path of he file current file
command! CopyFilePath silent :!echo "%:p" | xclip -i -sel c | ~/.vim/refresh_vim.sh
" Toggle trailingwhitespaces show
command! ToggleTrailingWhiteSpaces call ToggleTrailingWhiteSpaces()

" Setters

let mapleader=","  " Mapleader, for commands and stuff

set termguicolors

set nocompatible  " Disables compatibility with neovim
set noswapfile

set mouse-=a  " Disable mouse

set nobackup  " Chinguen a su madre los backups

set undodir=~/.vim/undodir/  " Directory where undofiles will go
set undofile  " Activate the undofile

set backspace=indent,eol,start  " Allows backspace on everything. Insert mode

set history=200  " keep 200 lines of command line history
set ruler  " show the cursor position all the time
set wildmenu  " display completion matches in a status line

set ttimeout  " time out for key codes
set ttimeoutlen=100  " wait up to 100ms after Esc for special key

set smartindent  " Configures indentantion
set expandtab  " Tabulations are spaces
set shiftwidth=4  " Width of tabulation is 4 by default
set tabstop=4  " ^

set number  " View linenumbers
set relativenumber  " View relative numbers
set numberwidth=6  " Length of the shown numbers setted to 6
set cursorline  " Highlight the line where cursor is
set scrolloff=10  " Keeps 10 lines when scroling on file
set encoding=utf-8  " Set default encoding to utf-8

set conceallevel=1  " Conceallevel

set colorcolumn=110  " Displays a margin at 110 characters

set title  " Displays the opened file path as terminal title
set laststatus=2 " Type of the status bar required for lightline/airline
set noshowmode  " Doesn't show the status bar
set noshowcmd  " Doesn't show the command that is being tiped

set completeopt=menuone  " Changes the way completion is showed

syntax on  " Enable syntax highlighting
filetype plugin on  " Enables filetype detection

" Filetype definition

au FileType python source ~/.vim/ftplugin/syntax/py.vim  " Python

au FileType javascript source ~/.vim/ftplugin/syntax/js.vim  " Javascript
au FileType typescript source ~/.vim/ftplugin/syntax/js.vim  " Typescript

au FileType c source ~/.vim/ftplugin/syntax/c.vim  " C
au FileType cpp source ~/.vim/ftplugin/syntax/cpp.vim  " C++

au FileType html source ~/.vim/ftplugin/syntax/html.vim " Html

au FileType css source ~/.vim/ftplugin/syntax/css.vim

" Coc
source ~/.vim/ftplugin/Plug_Config/Coc.vim

" Nerdtree
source ~/.vim/ftplugin/Plug_Config/NerdTree.vim

" Fzf
source ~/.vim/ftplugin/Plug_Config/Fzf.vim

" Matchup
source ~/.vim/ftplugin/Plug_Config/Matchup.vim

" CtrlP
source ~/.vim/ftplugin/Plug_Config/CtrlP.vim

" Airline
source ~/.vim/ftplugin/Plug_Config/AirLine.vim

" Indentline
source ~/.vim/ftplugin/Plug_Config/IndentLine.vim

" Rainbow brackets
let g:rainbow_active = 1

map Q gq  " Don't use ex mode

" Keymaps
source ~/.vim/ftplugin/maps.vim

" Enable ayu

let ayucolor="dark"

colorscheme ayu

