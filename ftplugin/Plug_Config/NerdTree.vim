
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Keymaps

noremap <C-u> :NERDTreeToggle <cr>  " Opens a NERDTree tab pressing Ctrl+u
noremap <leader><C-u> :NERDTreeFind <cr>  " Finds the actual file, and opens it in a NERDTreeTab

