
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 1
let g:matchup_matchparen_offscreen = {'method': 'popup'}

augroup matchup_matchparen_highlight
    autocmd!
    autocmd ColorScheme * hi MatchParen ctermfg=87 ctermbg=238
augroup END

