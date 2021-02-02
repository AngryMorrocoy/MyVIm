noremap <leader>w :w<ENTER>

" !COPY OR PASTE REQUIRES XCLIP

" Copy the slection on visual mode
vnoremap <leader>y :'<,'>%w !xclip -i -sel c <cr>

" Copy the content of the whole file (normal mode)
noremap <leader>Y :%w !xclip -i -sel c <cr>

" Paste whatever is on clipboard
noremap <leader>v :r !xclip -o -sel c <cr>

" Comment toggle VisualMode
vnoremap <leader>x :call NERDComment('x', 'toggle') <cr>
noremap  <leader>x :call NERDComment('n', 'toggle') <cr>

" Tab management
noremap nt :tabn <cr>
noremap pt :tabp <cr>
noremap xt :tabclose <cr>
noremap tt :tabnew <cr>

" Closes the actual file
noremap <leader><cr> :q <cr>
noremap <leader>q<cr> :q! <cr>

" Opens a terminal
noremap <leader>t :call Openterm()<cr>

" Toggles trailing whitespace
nmap <leader>- :ToggleTrailingWhiteSpaces <cr>

" Coc
nmap <silent> <leader>g :call CocAction("jumpDefinition") <cr>
nmap <silent> <leader>R :call CocAction("jumpReferences") <cr>
nmap <leader>.r <Plug>(coc-rename)

" CtrlP
nmap <silent> <leader>F :CtrlP <cr>
nmap <silent> <leader>f :CtrlPCurFile <cr>

" Autoclosing

inoremap (<cr> (<CR>)<C-c>O
inoremap (c ()<C-c>i

inoremap {<cr> {<CR>}<C-c>O
inoremap {c {}<C-c>i

inoremap [<cr> [<CR>]<C-c>O
inoremap [c []<C-c>i
