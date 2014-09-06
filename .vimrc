" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

" Folding settings
set foldmethod=syntax
set foldlevel=99

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

:let mapleader = "\<Space>"

" **********************************************************************
" Vim basic commands 
au FileType cpp map <F5> :make<bar>copen
au FileType python map <F3> :w !python<CR>
map <Leader>l :echo line('$')<CR>

" **********************************************************************
" Pathogen
call pathogen#infect()
call pathogen#helptags()

" **********************************************************************
" Tasklist
map <Leader>td <Plug>TaskList

" **********************************************************************
" Gundo (revision history)
map <Leader>gu :GundoToggle<CR>

" **********************************************************************
" Pyflakes (Python errors detection)
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'

" **********************************************************************
" NERDTree (File browsing)
map <Leader>nt :NERDTreeToggle<CR>

" **********************************************************************
" VMC (Vim multiple cursors)
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" **********************************************************************
" YouCompleteMe (Auto-completion)
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_auto_trigger = 1
let g:ycm_filetype_whitelist = { 'cpp': 1 }
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '!'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_global_ycm_extra_conf = '/home/felix/.ycm_extra_conf.py'
let g:ycm_filepath_completion_use_working_dir = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1

map <F12> :YcmCompleter GoTo<CR>

" **********************************************************************
" clang-format
map <C-K> :pyf /home/felix/llvm/tools/clang/tools/clang-format/clang-format.py<CR>
imap <C-K> <ESC>:pyf /home/felix/llvm/tools/clang/tools/clang-format/clang-format.py<CR>i 

" **********************************************************************
" Syntastic
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list=1

" **********************************************************************
" ghc-mod
" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

" **********************************************************************
" hdevtools
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" **********************************************************************
" UltiSnip
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"

" **********************************************************************
" Buffer Explorer
map <Leader>be  :BufExplorer<CR>

