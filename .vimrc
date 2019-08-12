"""""""""""""""""""""""Rquiremnets"""""""""""""""""
" 구름입력기 한글입력 편의성 
" brew install the_silver_searcher , vimgrep 너무 느려서 컨텐츠검색필요
" youcompleteme 설치후 cmake install 필요 및 서버재실행 필요
" pip install autopep8
""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""PEP8""""""""""""'"
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
Plugin 'joshdick/onedark.vim'    "one dark 테마
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline' "작업표시줄
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'      "작업표시줄 git track
Plugin 'airblade/vim-gitgutter'  "작업표시줄 git 변경사항 표시
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'gabesoft/vim-ags'
Plugin 'w0rp/ale'                "코드문법체크
Plugin 'Chiel92/vim-autoformat'  "코드 포매터
Plugin 'scrooloose/nerdcommenter' "Quick주석처리
Plugin 'christoomey/vim-tmux-navigator' "vim-tmux 이동
Plugin 'simeji/winresizer'       "vim split resizer
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

map ff :CtrlP<.><cr>

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set wildignore+=*/tmp/*,*__pycache__*,*.so,*.swp,*.zip,*.pyc,*.exe,*.dll
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|__pycache__)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$'
  \ }

"""""""""""""SPLIT WINDOW""""""""""""
set splitbelow
set splitright
""""""""""""CODE FOLDING"""""""""""""""""
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
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
""""""""""""""""""""""COLOR THEME"""""""""""""""
let python_highlight_all=1
syntax on
syntax enable
highlight LineNr ctermfg=yellow
set number
set cursorline
set background=dark
colorscheme base16-3024
""""""""""""""""""""""""fzf"""""""""""""""""""""
set rtp+=/Users/cjy/.vim/bundle/fzf
set rtp+=~/.vim/bundle/fzf
set rtp+=~/.fzf
nnoremap <C-f> :Files<Cr>
"""""""""""""""""""GIT GDIFF""""""""""""""""""""
"nmap <C-0> :Gwrite!<CR>
nmap d2 :diffget //2<Cr>
nmap d3 :diffget //3<Cr>

" Shift j,k move diff up down
nnoremap <expr> <S-K> &diff ? '[c' : '<C-W>k'
nnoremap <expr> <S-J> &diff ? ']c' : '<C-W>j'

""""""""""""""""FORMATTER""""""""""""""""""
noremap <F3> :Autoformat<CR>
""""""""""""""""FLAK8"""""""""""""""""""""
autocmd FileType python map <buffer> <F8> :call flake8#Flake8()<CR>
""""""""""""""""FAST WINDOW RESIZER""""""""""""""""""""
let g:winresizer_gui_enable = 1
""""""""""""""""AGS""""""""""""""
map fa :Ags<CR>

"""""""""""""""CUSTOM COMMAND""""""""""""""
"Quit Mapping
nnoremap <c-q> :q<CR> " normal mode: save
inoremap <c-q> <Esc>:q<CR> " insert mode: escape to normal and save
vnoremap <c-q> <Esc>:q<CR> " visual mode: escape to normal and save
" Save mapping
nnoremap <c-w> :w<CR> " normal mode: save
inoremap <c-w> <Esc>:w<CR> " insert mode: escape to normal and save
vnoremap <c-w> <Esc>:w<CR> " visual mode: escape to normal and save
map <C-_> :call NERDComment("n", "Sexy")<CR>
"map <C-> :call NERDComment("n", "Uncomment")<CR>
