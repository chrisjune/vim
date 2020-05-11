function! myconfig#before() abort
  let g:python_highlight_all = 1
  let g:python3_host_prog = expand('/Users/cjy/.pyenv/versions/3.6.8/bin/python3')
  map <F4> :NERDTreeFind<cr>
endfunction

function! myconfig#after() abort
  nnoremap <c-q> :q<CR> 
  inoremap <c-q> <Esc>:q<CR> 
  vnoremap <c-q> <Esc>:q<CR>

  nnoremap <c-w> :w<CR>
  inoremap <c-w> <Esc>:w<CR>
  vnoremap <c-w> <Esc>:w<CR>
  set colorcolumn=120

endfunction

