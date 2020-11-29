" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
" Get the defaults that most users want.


" Only do this part when compiled with support for autocommands.
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

function! Start_ycm()
    " Initializes YouCompleteMe
    execute 'packadd YouCompleteMe'
    execute 'source ~/.vim/ftplugin/Plug_Config/Ycm.vim'
endfunction

function! Start_emmet() 
    " Initializes emmet
    execute 'packadd emmet-vim'
endfunction

function! Openterm()
    " Opens a terminal
    belowright term zsh
    resize -8
endfunc

" Copy to clipboard the path of the file current file
command! CopyFilePath silent :!echo "%:p" | xclip -i -sel c | ~/Utilities/refresh_vim.sh

" Setters

let mapleader=","  " Mapleader, for commands and stuff

set nocompatible  " Disables compatibility with neovim

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

set number  " View linenumbers
set relativenumber  " View relative numbers
set numberwidth=6  " Length of the shown numbers setted to 6
set cursorline  " Highlight the line where cursor is
set scrolloff=10  " Keeps 10 lines when scroling on file

set autoindent  " Enables autindentation 
set encoding=utf-8  " Set default encoding to utf-8
set shiftwidth=4  " Width of tabulation is 4 by default
set tabstop=4  " ^
set expandtab  " Tabulations are spaces

set conceallevel=1  " Conceallevel

set colorcolumn=110  " Displays a margin at 110 characters

set title  " Displays the opened file path as terminal title
set laststatus=2 " Type of the status bar required for lightline
set noshowmode  " Doesn't show the status bar
set noshowcmd  " Doesn't show the command that is being tiped

syntax on  " Enable syntax highlighting
filetype plugin on  " Enables filetype detection

" Filetype definition

au FileType python source ~/.vim/ftplugin/syntax/py.vim  " Python

au FileType javascript source ~/.vim/ftplugin/syntax/js.vim  " Javascript
au FileType typescript source ~/.vim/ftplugin/syntax/js.vim  " Typescript

au FileType c source ~/.vim/ftplugin/syntax/c.vim  " C
au FileType cpp source ~/.vim/ftplugin/syntax/cpp.vim  " C++

au FileType html call Start_emmet()  " Html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Nerdtree
source ~/.vim/ftplugin/Plug_Config/NerdTree.vim

" Fzf
source ~/.vim/ftplugin/Plug_Config/Fzf.vim

" Matchup
source ~/.vim/ftplugin/Plug_Config/Matchup.vim

" Rainbow brackets
let g:rainbow_active = 1

" Keybindings

map Q gq  " Don't use ex mode
noremap <leader>w :w<ENTER>

" !COPY OR PASTE REQUIRES XCLIP 

" Copy the slection on visual mode
vnoremap <leader>y :'<,'>%w !xclip -i -sel c <cr>  
 

" Copy the content of the whole file (normal mode)
noremap <leader>Y :%w !xclip -i -sel c <cr>  

" Paste whatever is on clipboard
noremap <leader>v :r !xclip -o -sel c <cr>  

" Comment toggle VisualMode
vnoremap <leader>¿ :call NERDComment('x', 'toggle') <cr>

" Tab management
noremap nt :tabn <cr> 
noremap pt :tabp <cr> 
noremap ct :tabclose <cr>
noremap tt :tabnew <cr>

" Buffers management
map <c-n> :bn <cr> 
map <c-p> :bp <cr> 

" Closes the actual file
noremap <leader><cr> :q <cr>
noremap <leader>q<cr> :q! <cr>

" Opens a terminal
noremap <leader><c-t> :call Openterm()<cr>

" Enable sonokai

let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0

colorscheme sonokai

let g:lightline= {   
            \'colorscheme': 'PaperColor_dark' 
            \}

