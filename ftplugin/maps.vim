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

" Refresh vim
noremap <F5> :silent !~/.vim/refresh_vim.sh <cr>

" Toggles trailing whitespace
nmap <leader>- :ToggleTrailingWhiteSpaces <cr>

" Coc
nmap <silent> <leader>g :call CocAction("jumpDefinition") <cr>
nmap <silent> <leader>R :call CocAction("jumpReferences") <cr>

