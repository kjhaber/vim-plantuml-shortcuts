" vim-plantuml-tools
" Utility functions and mappings for PlantUML

" Reverse position of entities in relationship
" e.g. "a --> b : comment" becomes "b --> a : comment"
function! s:PlantumlToolsReverseEntity() range
  silent! execute a:firstline.','.a:lastline 's/\v(\w+)\s+([-<>\.a-zA-Z0-9]+)\s+(\w+)(.*)/\3 \2 \1\4/'
  nohlsearch
endfunction
command! -range PlantumlToolsReverseEntity silent! <line1>,<line2>call s:PlantumlToolsReverseEntity()<CR>

" Reverse the direction of arrow in relationship
" e.g. "a --> b : comment" becomes "a <-- b : comment"
function! s:PlantumlToolsReverseArrow() range
  silent! execute a:firstline.','.a:lastline 's/\v\<([-\.a-zA-Z0-9]+)/\1\}/'
  silent! execute a:firstline.','.a:lastline 's/\v([-\.a-zA-Z0-9]+)\>/\{\1/'
  silent! execute a:firstline.','.a:lastline 's/\v(\{)([-\.a-zA-Z0-9]+)/<\2/'
  silent! execute a:firstline.','.a:lastline 's/\v([-\.a-zA-Z0-9]+)(\})/\1>/'
  nohlsearch
endfunction
command! -range PlantumlToolsReverseArrow silent! <line1>,<line2>call s:PlantumlToolsReverseArrow()<CR>

" Reverse both the entity position and arrow direction
" e.g. "a --> b : comment" becomes "b <-- a : comment"
function! s:PlantumlToolsReverseRelation() range
  silent! execute a:firstline.','.a:lastline 'call s:PlantumlToolsReverseEntity()'
  silent! execute a:firstline.','.a:lastline 'call s:PlantumlToolsReverseArrow()'
endfunction
command! -range PlantumlToolsReverseRelation silent! <line1>,<line2>call s:PlantumlToolsReverseRelation()<CR>

if !exists('g:vim_plantuml_tools_map_keys')
  let g:vim_plantuml_tools_map_keys = 1
endif

if g:vim_plantuml_tools_map_keys
  nmap <Leader>ura :PlantumlToolsReverseArrow<CR>
  vmap <Leader>ura :'<,'>PlantumlToolsReverseArrow<CR>

  nmap <Leader>ure :PlantumlToolsReverseEntity<CR>
  vmap <Leader>ure :'<,'>PlantumlToolsReverseEntity<CR>

  nmap <Leader>urr :PlantumlToolsReverseRelation<CR>
  vmap <Leader>urr :'<,'>PlantumlToolsReverseRelation<CR>
endif

