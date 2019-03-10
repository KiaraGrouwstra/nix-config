call plug#begin('~/.vim/plugged')

set tabstop=4
set softtabstop=4
set expandtab

set number
set showcmd
set showcmd
filetype indent on

set wildmenu
set lazyredraw
set showmatch

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

nnoremap <leader><space> :nohlsearch<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
"
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
"
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" syntax
Plug 'scrooloose/syntastic'
" find files, buffers, most recently used, tags
Plug 'ctrlpvim/ctrlp.vim'
" status/tabline
Plug 'vim-airline/vim-airline'
" auto-completion, language engines built-in?
" Plug 'valloric/youcompleteme'
" Git commands

Plug 'tpope/vim-fugitive'
Plug 'eagletmt/ghcmod-vim'
Plug 'parsonsmatt/intero-neovim'

Plug 'tomasiser/vim-code-dark'

let NERDTreeShowHidden=1 " Show hidden files

" Show/hide NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Initialize plugin system
call plug#end()

color codedark
" colorscheme codedark
let g:airline_theme = 'codedark'
syntax enable

