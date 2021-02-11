" Saves the file
noremap <leader>w :w<cr>
" Fast indentation
nnoremap > >>
nnoremap < <<

" !COPY OR PASTE REQUIRES XCLIP

" Copy the slection on visual mode
vnoremap <leader>y :w !xclip -i -sel c <cr>

" Copy the content of the whole file (normal mode)
noremap <leader>Y :%w !xclip -i -sel c <cr>

" Paste whatever is on clipboard
noremap <leader>v :r !xclip -o -sel c <cr>

" Comment toggle VisualMode
vnoremap <leader>x :call NERDComment('x', 'toggle') <cr>
noremap  <leader>x :call NERDComment('n', 'toggle') <cr>

" Tab management
noremap tp :tabn <cr>
noremap tu :tabp <cr>
noremap tw :tabclose <cr>
noremap tt :tabnew <cr>

" Closes the actual file
noremap <leader><cr> :q <cr>
noremap <leader>q<cr> :q! <cr>

" Opens a terminal
noremap <leader>t :call Openterm()<cr>

" Coc
nmap <silent>   <leader>g :call CocAction("jumpDefinition") <cr>
nmap <silent>   <leader>R :call CocAction("jumpReferences") <cr>
nmap <leader>.r <Plug>(coc-rename)

" CtrlP
nmap <silent> <leader>f :CtrlPCurWD <cr>
nmap <silent> <leader>F :CtrlP <cr>
nmap <silent> <leader>lf :CtrlPLine <cr>

" Scroll up the window

nnoremap <C-q> <C-y>

" Splits stuff

" Smooth movement
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
" Resizing
nnoremap <C-w>0    <C-w>=
nnoremap <C-Right> <C-w><
nnoremap <C-Left>  <C-w>>
nnoremap <C-Up>    <C-w>+
nnoremap <C-Down>  <C-w>-


" Autoclosing

inoremap (\ (
inoremap (<BS> <C-c>i
inoremap ( ()<C-c>i
inoremap (<cr> (<CR>)<C-c>O
inoremap (; ();<C-c>hi
inoremap (;<cr> (<CR>);<C-c>O
inoremap (: ():<C-c>hi

inoremap {\ {
inoremap {<BS> <C-c>i
inoremap { {}<C-c>i
inoremap {<cr> {<CR>}<C-c>O
inoremap {; {};<C-c>hi
inoremap {;<cr> {<CR>};<C-c>O

inoremap [\ [
inoremap [<BS> <C-c>i
inoremap [ []<C-c>i
inoremap [<cr> [<CR>]<C-c>O
inoremap [, [],<C-c>hi
inoremap [; [];<C-c>hi
inoremap [;<cr> [<CR>];<C-c>O

