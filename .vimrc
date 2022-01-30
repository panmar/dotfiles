set nocompatible

" let mapleader=","

if has("gui_running")
	set guifont=Inconsolata\ 10
endif

" some plugins do not work when 'filetype on' during loading
filetype off

call plug#begin('~/.vim/plugged')
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'bash install.sh' }
Plug 'sjl/badwolf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

set softtabstop=4
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set number
set visualbell
set noerrorbells
set cursorline
set scrolloff=5

set nobackup
set noswapfile

if has('mouse')
	set mouse=a
endif

" case-sensitive search only when uppercase letter present in search string
set ignorecase
set smartcase

" apply substitutions globally by default (without /g at the end)
set gdefault

" highlight found patterns
set hlsearch

" this is easier to use then default leader "\"
let mapleader=","

" move between matching parenthesis using tab
" nnoremap <tab> %
" vnoremap <tab> %

" make scrolling vieport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" movement by screen line instread of file line
nnoremap j gj
nnoremap k gk

" toggle visible whitespaces
nmap <silent> <leader>s :set nolist!<CR>

nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>

colorscheme badwolf

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pylsp'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

