"""""""""""""""""""""""Rquiremnets"""""""""""""""""
" 구름입력기 한글입력 편의성 
" brew install the_silver_searcher , vimgrep 너무 느려서 컨텐츠검색필요
" youcompleteme 설치후 cmake install 필요 및 서버재실행 필요
" pip install autopep8
""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""PEP8""""""""""""'"
set t_Co=256
set term=xterm-256color
set nocompatible              " required
filetype off                  " required

set hlsearch
set nu
set encoding=utf-8
set clipboard=unnamed          "System Clipboard
set visualbell

set warn "저장안하고 종료시 경고
set sm "show match
set colorcolumn=120

set noswapfile "swp 파일 미생성
set autoread "파일갱신시 자동갱신

set cpoptions+=$
set diffopt+=vertical
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2| 
    \ set softtabstop=2| 
    \ set shiftwidth=2

au BufNewFile,BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=120|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix

""""""""""""""""""""""''" Django Vim Setting""""""""""""""""""""""''"
let g:last_relative_dir = ''
"""""""""""""""""""""""""""VUNDLE"""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'valloric/youcompleteme'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline' "작업표시줄
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'      "작업표시줄 git track
Plugin 'airblade/vim-gitgutter'  "작업표시줄 git 변경사항 표시
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'gabesoft/vim-ags'
Plugin 'Chiel92/vim-autoformat'  "코드 포매터
"Plugin 'w0rp/ale'                "코드문법체크
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter' "Quick주석처리
Plugin 'christoomey/vim-tmux-navigator' "vim-tmux 이동
Plugin 'simeji/winresizer'       "vim split resizer
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-python/python-syntax'
Plugin 'Lokaltog/vim-easymotion' "한화면에서 커서이동
"Plugin 'rainglow/vim'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'lifepillar/vim-solarized8'
"Plugin 'daylerees/colour-schemes'
"Plugin 'vim-vdebug/vdebug'       "코드 디버거

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""CtrlP""""""""""""""""""
" 자동완성
"  파일찾기 ctrlp 속도향상을 위한 특정디렉토리 무시

"map ff :CtrlP<.><cr>

"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
    "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

"set wildignore+=*/tmp/*,*__pycache__*,*.so,*.swp,*.zip,*.pyc,*.exe,*.dll
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn|__pycache__)$',
  "\ 'file': '\v\.(exe|so|dll|pyc)$'
  "\ }

"""""""""""""SPLIT WINDOW""""""""""""
set splitbelow
set splitright 
"""""""""""winsplit"""""""""""""""""""'
let g:winresizer_start_key = '<C-T>'
""""""""""""CODE FOLDING"""""""""""""""""
set foldmethod=syntax
set foldlevel=1
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_docstring=0

"""""""""""YOU COMPLETE ME"""""""""""""""""""
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ "python":1,
			\ }
let g:ycm_semantic_triggers = { 'python': [ 're!\w{2}' ] }
"""""""""""""""""""""""CTAGS"""""""""""""""""""""""
"set tags=/Users/cjy/project/api/29cm/tags 
""""""""""""""""""""""NERDTREE""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize=15
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":AGS\<cr>"
"""""""""""""""""""""COLOR THEME"""""""""""""""
"let base16colorspace=256
"set termguicolors
let g:python_highlight_all = 1

"syntax enable
highlight LineNr ctermfg=yellow
set number
set cursorline
"
" 컬러 스킴 사용
"colorscheme PaperColor
set background=dark
"colorscheme base16-3024
colorscheme base16-onedark

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif

" 구문 강조 사용
if has("syntax")
 syntax on
endif


" papercolor 옵션
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

"""""""""""""""""""""""vim-ariline"""""""""""""
let g:airline_theme='base16'
""""""""""""""""""""""""fzf"""""""""""""""""""""
set rtp+=/Users/cjy/.vim/bundle/fzf
set rtp+=~/.vim/bundle/fzf
set rtp+=~/.fzf

"nnoremap <silent> <C-f> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif

map ff :FZF<cr>
"""""""""""""""""""GIT GDIFF""""""""""""""""""""
"nmap <C-0> :Gwrite!<CR>
nmap d2 :diffget //2<Cr>
nmap d3 :diffget //3<Cr>

" Shift j,k move diff up down
nnoremap <expr> <S-I> &diff ? '[c' : '<C-W>k'
nnoremap <expr> <S-U> &diff ? ']c' : '<C-W>j'

""""""""""""""""FORMATTER""""""""""""""""""
noremap <F3> :Autoformat<CR>
""""""""""""""""FLAK8"""""""""""""""""""""
autocmd FileType python map <buffer> <F8> :call flake8#Flake8()<CR>
""""""""""""""""""SYNTASTIC"""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { 'regex': 'W391' } "Ignore blank line end of page
""""""""""""""""FAST WINDOW RESIZER""""""""""""""""""""
let g:winresizer_gui_enable = 1
""""""""""""""""AGS""""""""""""""
map fa :Ags<CR>
nnoremap <Leader>a :Ags<Space>
vnoremap <Leader>s y:Ags<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
nnoremap <Leader>s :Ags<Space><C-R>=expand('<cword>')<CR><CR>
nnoremap <Leader><Leader>a :AgsQuit<CR>
"nnoremap <c-f> :Ags<Space>

"""""""""""""""CUSTOM COMMAND""""""""""""""
"Quit Mapping
nnoremap <c-q> :q<CR> " normal mode: save
inoremap <c-q> <Esc>:q<CR> " insert mode: escape to normal and save
vnoremap <c-q> <Esc>:q<CR> " visual mode: escape to normal and save
" Save mapping
nnoremap <c-w> :w<CR> " normal mode: save
inoremap <c-w> <Esc>:w<CR> " insert mode: escape to normal and save
vnoremap <c-w> <Esc>:w<CR> " visual mode: escape to normal and save
""""""""""""""" NERDComment """"""""'
map <C-_> :call NERDComment("n", "Sexy")<CR>
map <C-\> :call NERDComment("n", "Uncomment")<CR>
""""""""""""""" vim easymotion """"""""""""
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
