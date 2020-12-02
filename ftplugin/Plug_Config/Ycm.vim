
noremap <leader>.r :YcmCompleter RefactorRename
noremap <leader>d :YcmCompleter GetDoc <cr>
noremap <leader>g :tab YcmCompleter GoToDefinition <cr>
noremap <leader>R :YcmCompleter GoToReferences <cr>
noremap <leader>t :YcmCompleter GetType <cr>

let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_auto_trigger = 1
let g:ycm_max_num_candidates = 30
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0

let g:ycm_goto_buffer_command = 'split-or-existing-window'

