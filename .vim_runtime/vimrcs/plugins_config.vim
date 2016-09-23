""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect('~/.vim_runtime/sources_forked/{}')
call pathogen#infect('~/.vim_runtime/sources_non_forked/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers=['pylint', 'pep8']
let g:syntastic_python_pep8_args = "--ignore=E4,E501"
let g:syntastic_python_pylint_args = "--disable=F0401"
let g:syntastic_javascript_checkers = ['eslint']

" Custom CoffeeScript SyntasticCheck
func! SyntasticCheckCoffeescript()
    let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
    execute "e " . l:filename
    execute "SyntasticCheck"
    execute "Errors"
endfunc
nnoremap <silent> <leader>l :call SyntasticCheckCoffeescript()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive (git wrapper)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Personal shortcut grep for all ocurrences of the current word in my git tree
map <F4> :silent Ggrep <c-r><c-w> -- './' ':(exclude)*.min.js' ':(exclude)*.mo' ':(exclude)*.po' <bar> :copen <bar> :redraw!<cr>

" alias default Ggrep to exclude files I rarely care about. Can still use default Ggrep to avoid this
command -nargs=+ GG :silent Ggrep <args> -- './' ':(exclude)*.min.js' ':(exclude)*.mo' ':(exclude)*.po' <bar> :copen <bar> :redraw!
