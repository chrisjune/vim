function! myconfig#before() abort
  let g:python_highlight_all = 1
  let g:python3_host_prog = expand('/Users/cjy/.pyenv/versions/3.6.8/bin/python3')
  map <F4> :NERDTreeFind<cr>

  "let g:neomake_python_enabled_makers = ['flake8']
  let g:neoformat_enabled_python = ['autopep8', 'yapf']
  "let g:neoformat_verbose = 1

  " SimplyFold 
  set nofoldenable
endfunction

function! myconfig#after() abort
  nnoremap <c-q> :q<CR> 
  inoremap <c-q> <Esc>:q<CR> 
  vnoremap <c-q> <Esc>:q<CR>

  nnoremap <c-w> :w<CR>
  inoremap <c-w> <Esc>:w<CR>
  vnoremap <c-w> <Esc>:w<CR>
  set colorcolumn=120

  noremap <leader>gd :Gdiffsplit!<CR>

  nmap d2 :diffget //2<Cr>
  nmap d3 :diffget //3<Cr>

  " Shift j,k move diff up down
  nnoremap <space-k> &diff ? '[c' : '<C-W>k'
  nnoremap <space-j> &diff ? ']c' : '<C-W>j'

  noremap <leader>gc :Gcommit<CR>
  noremap <leader>gs :Gstatus<CR>
  noremap <leader>gw :Gwrite<CR>
  noremap <leader>gb :Gblame<CR>

  " Do not make swap file
  set noswapfile

  let g:SimpylFold_docstring_preview = 1
  set foldmethod=indent

endfunction

