" Indentacion config

setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

" Run command

noremap <Leader>r :!clear && node '%' <Enter>

" Start autocompletion

execute 'call Start_ycm()'

