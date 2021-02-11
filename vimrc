" __  __ ____  _      __     ___
"|  \/  |  _ \( )___  \ \   / (_)_ __ ___  _ __ ___
"| |\/| | |_) |// __|  \ \ / /| | '_ ` _ \| '__/ __|
"| |  | |  _ <  \__ \   \ V / | | | | | | | | | (__
"|_|  |_|_| \_\ |___/    \_/  |_|_| |_| |_|_|  \___|

" Moving vim to ~/.config/vim instead of ~/.vim
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

augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

augroup END

" Fuck trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
" More clear split lines
autocmd Colorscheme * highlight VertSplit guibg=NONE guifg=fg
" Saves the colorscheme default guibg
autocmd Colorscheme * let g:default_guibg=synIDattr(hlID("Normal"), "bg#")
" Saves the colorscheme default ctermbg
autocmd Colorscheme * let g:default_ctermbg=synIDattr(hlID("Normal"), "bg")

" Functions and commands

function! Openterm()
    " Opens a terminal
    belowright term zsh
    resize -8
endfunc

function! ToggleBackgroundTransparency()
    " Toggles the background transparency
    let actual_ctermbg = synIDattr(hlID("Normal"), "bg")
    let actual_guibg = synIDattr(hlID("Normal"), "bg#")
    if actual_ctermbg != "" && actual_guibg != ""
        highlight Normal ctermbg=NONE guibg=NONE
    else
        execute 'highlight Normal guibg='.g:default_guibg
    endif
endf

" Copy to clipboard the path of he file current file
command! CopyFilePath silent :!echo "%:p" | xclip -i -sel c
" Toggles the background transparency
command! ToggleBackgroundTransparency call ToggleBackgroundTransparency()

" Setters

let mapleader=","  " Mapleader, for commands and stuff
set fillchars+=vert:¦  " Vertsplit character

set termguicolors " Use the colors of the terminal

set nocompatible  " Disables compatibility with vi
set noswapfile " Disable the swapfiles

set mouse-=a  " Disable mouse

set nobackup  " Chinguen a su madre los backups

set undodir=~/.config/vim/undodir/  " Directory where undofiles will go
set undofile  " Activate the undofile

set backspace=indent,eol,start  " Allows backspace on everything. Insert mode

set history=50  " keep 50 lines of command line history
set ruler  " show the cursor position all the time
set wildmenu  " display completion matches in a status line

set ttimeout  " time out for key codes
set ttimeoutlen=100  " wait up to 100ms after Esc for special key

set splitright " When split the window, do it to the right
set splitbelow " When split the window, do it below

set smartindent  " Configures indentantion
set expandtab  " Tabulations are spaces
set shiftwidth=4  " Width of tabulation is 4 by default
set tabstop=4  " ^

set showtabline=2 " Always shows the tabline
set number  " View linenumbers
set relativenumber  " View relative numbers
set numberwidth=3  " Length of the shown numbers
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
    " Loads Matchup
    packadd vim-matchup
    source ~/.config/vim/ftplugin/Plug_Config/Matchup.vim
endif

" Nerdtree
source ~/.config/vim/ftplugin/Plug_Config/NerdTree.vim

" CtrlP
source ~/.config/vim/ftplugin/Plug_Config/CtrlP.vim

" Airline
source ~/.config/vim/ftplugin/Plug_Config/AirLine.vim

" EasyMotion
source ~/.config/vim/ftplugin/Plug_Config/EasyMotion.vim

map Q gq  " Don't use ex mode

" Keymaps
source ~/.config/vim/ftplugin/maps.vim

" Colorscheme configuration

if version > 800
    let ayucolor="mirage"
    colorscheme ayu
else
    colorscheme koehler
endif

