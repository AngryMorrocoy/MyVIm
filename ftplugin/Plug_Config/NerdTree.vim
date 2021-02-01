
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" If another buffer tries to replace NERDTree, put in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
" Open the existing NERDTree on each new tab.
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
autocmd BufWinEnter * silent NERDTreeMirror

" Keymaps

noremap <C-u> :NERDTreeToggle <cr>  " Opens a NERDTree tab pressing Ctrl+u
noremap <leader><C-u> :NERDTreeFind <cr>  " Finds the actual file, and opens it in a NERDTreeTab

let g:NERDTreeMapActivateNode = "l"
