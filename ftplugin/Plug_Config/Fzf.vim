set rtp+=~/.fzf  " Adds fzf to the runtimepath

function Files(fromroot, hidden, bang)  " Function to search, needs optimization
    let oldConf = $FZF_DEFAULT_COMMAND
    if a:hidden == 1
        let $FZF_DEFAULT_COMMAND="find ."
    endif

    if a:fromroot == 0
        if a:bang == 1
            FZF! --reverse --info=inline
        elseif a:bang == 0
            FZF --reverse --info=inline
        endif

    elseif a:fromroot == 1
        if a:bang == 1
            FZF! --reverse --info=inline ~
        elseif a:bang == 0
            FZF --reverse --info=inline ~
        endif
    endif

    let $FZF_DEFAULT_COMMAND=oldConf
endfunc

noremap <leader>f :call Files(0, 0, 0)<cr>
noremap <leader>F :call Files(1, 0, 0)<cr> 
noremap <leader>hf :call Files(0, 1, 0) <cr>
noremap <leader>hF :call Files(1, 1, 0) <cr>

noremap <leader>.f :call Files(0, 0, 1)<cr>
noremap <leader>.F :call Files(1, 0, 1)<cr>
noremap <leader>.hf :call Files(0, 1, 1) <cr>
noremap <leader>.hF :call Files(1, 1, 1) <cr>

