set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""" PLUGINS 

" Code
Plugin 'Valloric/YouCompleteMe'         " Code completion
Plugin 'critiqjo/lldb.nvim'             " LLVM debugger integration
Plugin 'SirVer/ultisnips'               " Code snippets

" Files
Plugin 'scrooloose/nerdtree'            " Tree explorer
Plugin 'junegunn/fzf', { 'dir': '~/.fzf' }
Plugin 'junegunn/fzf.vim'               " Fuzzy file search

" Git
Plugin 'tpope/vim-fugitive'             " Git wrapper
Plugin 'airblade/vim-gitgutter'         " Shows git diff in the gutter
Plugin 'Xuyuanp/nerdtree-git-plugin'    " Shows git status flags in NERDTree

" Utils
Plugin 'Raimondi/delimitMate'           " Automatic closing of quostes, parenthesis, brackets, etc.
Plugin 'Valloric/MatchTagAlways'        " Highlights the enclosing XML/HTML tags
Plugin 'bling/vim-airline'              " Vim status bar
Plugin 'ryanoasis/vim-devicons'         " Icons are awesome
Plugin 'mhartington/oceanic-next'       " Color scheme

" All of the Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

"""""" COLORS
syntax enable
colorscheme OceanicNext
set background=dark

hi CursorLineNR guifg=#ffffff  " Highlight the current line number

""""" SPACE & TABS
set tabstop=4		    " number of visual spaces per TAB
set softtabstop=4	    " number of spaces in tab when editing
set expandtab		    " tabs are spaces

"""""" UI CONFIG
set number			    " show line numbers
set showcmd			    " show command in bottom bar
set cursorline		    " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set colorcolumn=120     " highlight 120th coloumn
set laststatus=2        " always show status bar

"""""" SEARCHING
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn search hightlight
nnoremap <leader><space> :nohlsearch<CR>

"""""" FOLDING
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" space opens/closes folds
nnoremap <space> za

"""""" MOVEMENT

" move vertically by visual line
nnoremap j gj
nnoremap k gk
 
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap ^ <nop> 
nnoremap $ <nop>

" highlight last inserted text
nnoremap gV `[v`]

"""""" SYSTEM SETTINGS
let mapleader=","       " leader is comma

" jk is escape
"inoremap jk <esc>

" Sets up an undo file so changes won't be lost when closing a file
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

" Remeber cursor position between vim sessions
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
" Center buffer around cursor when opening files
autocmd BufRead * normal zz

" Disabling ex mode
nnoremap Q <nop>

" Disabling macro recording
nnoremap q <nop>

" Exit insert, delete line, reenter insert
inoremap <c-d> <esc>ddi

" One less keystroke to execute a command
nnoremap ; :

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"""""" PLUGINS CONFIGURATIONS

""" ClangFormat
map <C-K> :pyf ~/llvm/tools/clang/tools/clang-format/clang-format.py<cr>
map <C-K> <c-o>:pyf ~/llvm/tools/clang/tools/clang-format/clang-format.py<cr>

""" NERDTree
map <C-n> :NERDTreeToggle<CR>   " Key shortcut

" Opens NERDTree automatically when nvim starts up
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

""" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
