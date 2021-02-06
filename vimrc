set runtimepath=~/.config/vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.config/vim/after
set packpath=~/.config/vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.config/vim/after

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
command! CopyFilePath silent :!echo "%:p" | xclip -i -sel c
" Toggle trailingwhitespaces show
command! ToggleTrailingWhiteSpaces call ToggleTrailingWhiteSpaces()

" Setters

let mapleader=","  " Mapleader, for commands and stuff

set notermguicolors " Doesn't use the colors of the terminal

set nocompatible  " Disables compatibility with vi
set noswapfile " Disable the swapfiles

set mouse-=a  " Disable mouse

set nobackup  " Chinguen a su madre los backups

set undodir=~/.config/vim/undodir/  " Directory where undofiles will go
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

set cmdheight=2
set title  " Displays the opened file path as terminal title
set laststatus=2 " Type of the status bar required for lightline/airline
set noshowmode  " Doesn't show the status bar
set noshowcmd  " Doesn't show the command that is being tiped

set completeopt=menuone  " Changes the way completion is showed

syntax on  " Enable syntax highlighting
filetype plugin on  " Enables filetype detection

" Filetype definition

au FileType python source ~/.config/vim/ftplugin/syntax/py.vim  " Python

au FileType javascript source ~/.config/vim/ftplugin/syntax/js.vim  " Javascript
au FileType typescript source ~/.config/vim/ftplugin/syntax/js.vim  " Typescript
au FileType typescript source ~/.config/vim/ftplugin/syntax/json.vim  " Json

au FileType c source ~/.config/vim/ftplugin/syntax/c.vim  " C
au FileType cpp source ~/.config/vim/ftplugin/syntax/cpp.vim  " C++

au FileType html source ~/.config/vim/ftplugin/syntax/html.vim " Html

au FileType css source ~/.config/vim/ftplugin/syntax/css.vim " Css

if version > 800 " If not started as vi
    " Loads coc
    packadd coc.nvim-release
    source ~/.config/vim/ftplugin/Plug_Config/Coc.vim
    " Loads vim-devicons
    packadd vim-devicons
    " Loads IndentLine
    packadd indentLine
    source ~/.config/vim/ftplugin/Plug_Config/IndentLine.vim
endif


" Nerdtree
source ~/.config/vim/ftplugin/Plug_Config/NerdTree.vim

" Matchup
source ~/.config/vim/ftplugin/Plug_Config/Matchup.vim

" CtrlP
source ~/.config/vim/ftplugin/Plug_Config/CtrlP.vim

" Airline
source ~/.config/vim/ftplugin/Plug_Config/AirLine.vim

" EasyMotion
source ~/.config/vim/ftplugin/Plug_Config/EasyMotion.vim

" Rainbow brackets
let g:rainbow_active = 1

map Q gq  " Don't use ex mode

" Keymaps
source ~/.config/vim/ftplugin/maps.vim

" Colorscheme configuration

if version > 800
    colorscheme sonokai
else
    colorscheme koehler
endif

